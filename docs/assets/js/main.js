/* ===================================================================
   NixOS Config Docs — main.js
   Lightweight, no dependencies
   =================================================================== */

'use strict';

/* ─── Mobile nav toggle ─────────────────────────────────────────────── */
(function initMobileNav() {
  const toggle = document.getElementById('topnav-toggle');
  const mobileNav = document.getElementById('mobile-nav');
  if (!toggle || !mobileNav) return;

  toggle.addEventListener('click', () => {
    const isOpen = mobileNav.classList.toggle('open');
    toggle.setAttribute('aria-expanded', String(isOpen));
    mobileNav.setAttribute('aria-hidden', String(!isOpen));
  });

  document.addEventListener('click', (e) => {
    if (!toggle.contains(e.target) && !mobileNav.contains(e.target)) {
      mobileNav.classList.remove('open');
      toggle.setAttribute('aria-expanded', 'false');
      mobileNav.setAttribute('aria-hidden', 'true');
    }
  });
})();

/* ─── Docs sidebar toggle (mobile) ──────────────────────────────────── */
(function initDocsSidebar() {
  const openBtn  = document.getElementById('sidebar-open');
  const closeBtn = document.getElementById('sidebar-close');
  const sidebar  = document.getElementById('docs-sidebar');
  const overlay  = document.getElementById('sidebar-overlay');
  if (!sidebar) return;

  function openSidebar() {
    sidebar.classList.add('open');
    if (overlay) { overlay.classList.add('on'); overlay.removeAttribute('aria-hidden'); }
    document.body.style.overflow = 'hidden';
  }

  function closeSidebar() {
    sidebar.classList.remove('open');
    if (overlay) { overlay.classList.remove('on'); overlay.setAttribute('aria-hidden', 'true'); }
    document.body.style.overflow = '';
  }

  openBtn  && openBtn.addEventListener('click', openSidebar);
  closeBtn && closeBtn.addEventListener('click', closeSidebar);
  overlay  && overlay.addEventListener('click', closeSidebar);

  // Close when a sidebar link is clicked on mobile
  sidebar.querySelectorAll('.sb-link').forEach((link) => {
    link.addEventListener('click', () => {
      if (window.innerWidth < 900) closeSidebar();
    });
  });
})();

/* ─── Sidebar group collapse ─────────────────────────────────────────── */
(function initSidebarGroups() {
  document.querySelectorAll('.sb-group-btn').forEach((btn) => {
    btn.addEventListener('click', () => {
      const expanded = btn.getAttribute('aria-expanded') === 'true';
      btn.setAttribute('aria-expanded', String(!expanded));
      const targetId = btn.getAttribute('aria-controls');
      const target = document.getElementById(targetId);
      if (target) target.classList.toggle('collapsed', expanded);
    });
  });
})();

/* ─── Active TOC + sidebar link on scroll ────────────────────────────── */
(function initScrollspy() {
  const tocLinks     = document.querySelectorAll('.toc-link');
  const sidebarLinks = document.querySelectorAll('.sb-link');
  if (tocLinks.length === 0 && sidebarLinks.length === 0) return;

  // Collect all anchored sections in document order
  const headings = Array.from(
    document.querySelectorAll('.doc-sec[id], section[id]')
  );

  const navH = 56 + 32; // nav height + extra offset

  function updateActive() {
    let activeId = null;
    const scrollY = window.scrollY + navH;

    for (let i = headings.length - 1; i >= 0; i--) {
      if (headings[i].getBoundingClientRect().top + window.scrollY <= scrollY) {
        activeId = headings[i].id;
        break;
      }
    }

    tocLinks.forEach((link) => {
      link.classList.toggle('active', link.getAttribute('href') === '#' + activeId);
    });
    sidebarLinks.forEach((link) => {
      link.classList.toggle('active', link.getAttribute('href') === '#' + activeId);
    });
  }

  window.addEventListener('scroll', updateActive, { passive: true });
  updateActive();
})();

/* ─── Copy code block buttons ────────────────────────────────────────── */
(function initCopyButtons() {
  document.querySelectorAll('.copy-btn').forEach((btn) => {
    btn.addEventListener('click', () => {
      // Walk up to the .cb container and grab the pre inside it
      const cb  = btn.closest('.cb');
      const pre = cb && cb.querySelector('pre');
      if (!pre) return;

      // Strip prompt characters from the copied text
      const text = pre.textContent
        .replace(/^\$ /gm, '')   // remove leading "$ "
        .trim();

      const original = btn.innerHTML;

      navigator.clipboard.writeText(text).then(() => {
        btn.textContent = '✓ Copied';
        btn.classList.add('ok');
        setTimeout(() => { btn.innerHTML = original; btn.classList.remove('ok'); }, 2000);
      }).catch(() => {
        // Fallback for older browsers
        const ta = document.createElement('textarea');
        ta.value = text;
        ta.style.cssText = 'position:fixed;opacity:0;pointer-events:none';
        document.body.appendChild(ta);
        ta.select();
        try { document.execCommand('copy'); } catch (_) { /* silent */ }
        document.body.removeChild(ta);
      });
    });
  });
})();

/* ─── Copy inline (shell cards) ──────────────────────────────────────── */
(function initCopyInline() {
  document.querySelectorAll('.copy-inline').forEach((btn) => {
    btn.addEventListener('click', () => {
      const text = btn.dataset.copy
        || btn.closest('.shell-cmd')?.querySelector('code')?.textContent;
      if (!text) return;

      navigator.clipboard.writeText(text).then(() => {
        btn.textContent = '✓';
        btn.classList.add('ok');
        setTimeout(() => { btn.textContent = '⧉'; btn.classList.remove('ok'); }, 1500);
      }).catch(() => {
        const ta = document.createElement('textarea');
        ta.value = text;
        ta.style.cssText = 'position:fixed;opacity:0;pointer-events:none';
        document.body.appendChild(ta);
        ta.select();
        try { document.execCommand('copy'); } catch (_) { /* silent */ }
        document.body.removeChild(ta);
      });
    });
  });
})();

/* ─── Dev shells search & filter ─────────────────────────────────────── */
(function initShellsFilter() {
  const searchInput = document.getElementById('shell-search');
  const grid        = document.getElementById('shells-grid');
  const emptyMsg    = document.getElementById('shells-empty');
  const filterTags  = document.querySelectorAll('[data-filter]');
  if (!searchInput || !grid) return;

  let activeFilter = 'all';

  function runFilter() {
    const query = searchInput.value.trim().toLowerCase();
    const cards = grid.querySelectorAll('.shell-card');
    let visible = 0;

    cards.forEach((card) => {
      const name = (card.dataset.name || '').toLowerCase();
      const cat  = (card.dataset.cat  || '').toLowerCase();
      const show = (!query || name.includes(query))
                && (activeFilter === 'all' || cat.includes(activeFilter));
      card.style.display = show ? '' : 'none';
      if (show) visible++;
    });

    if (emptyMsg) emptyMsg.hidden = visible > 0;
  }

  searchInput.addEventListener('input', runFilter);

  filterTags.forEach((btn) => {
    btn.addEventListener('click', () => {
      filterTags.forEach((b) => b.classList.remove('on'));
      btn.classList.add('on');
      activeFilter = btn.dataset.filter;
      runFilter();
    });
  });
})();

/* ─── Keybindings search & filter ────────────────────────────────────── */
(function initKbFilter() {
  const searchInput = document.getElementById('kb-search');
  const emptyMsg    = document.getElementById('kb-empty');
  const filterTags  = document.querySelectorAll('[data-kb-filter]');
  const sections    = document.querySelectorAll('[data-kb-cat]');
  if (!searchInput) return;

  let activeFilter = 'all';

  function runFilter() {
    const query = searchInput.value.trim().toLowerCase();
    let totalVisible = 0;

    sections.forEach((section) => {
      const cat      = (section.dataset.kbCat || '').toLowerCase();
      const matchCat = activeFilter === 'all' || cat === activeFilter;

      if (!matchCat) { section.style.display = 'none'; return; }
      if (!query)    { section.style.display = ''; totalVisible++; return; }

      // Search within rows — skip sub-header rows (td[colspan])
      const rows = section.querySelectorAll('tbody tr');
      let sectionVisible = 0;
      rows.forEach((row) => {
        if (row.querySelector('td[colspan]')) { row.style.display = ''; return; }
        const text = row.textContent.toLowerCase();
        const show = text.includes(query);
        row.style.display = show ? '' : 'none';
        if (show) sectionVisible++;
      });

      section.style.display = sectionVisible > 0 ? '' : 'none';
      totalVisible += sectionVisible;
    });

    if (emptyMsg) emptyMsg.hidden = totalVisible > 0;
  }

  searchInput.addEventListener('input', runFilter);

  filterTags.forEach((btn) => {
    btn.addEventListener('click', () => {
      filterTags.forEach((b) => b.classList.remove('on'));
      btn.classList.add('on');
      activeFilter = btn.dataset.kbFilter;
      runFilter();
    });
  });
})();

/* ─── Sticky nav scroll effect ───────────────────────────────────────── */
(function initNavScroll() {
  const nav = document.getElementById('topnav');
  if (!nav) return;

  window.addEventListener('scroll', () => {
    nav.style.borderBottomColor = window.scrollY > 4
      ? 'var(--border)'
      : 'transparent';
  }, { passive: true });
})();

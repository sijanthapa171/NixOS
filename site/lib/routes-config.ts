export const currentVersion = "v3.5.9";

// for page navigation & to sort on leftbar

export type EachRoute = {
  title: string;
  href: string;
  noLink?: true;
  items?: EachRoute[];
};

export const ROUTES: EachRoute[] = [
  {
    title: "Getting Started",
    href: "/getting-started",
    noLink: true,
    items: [
      { title: "Introduction", href: "/introduction" },
      {
        title: "Installation",
        href: "/installation",
        items: [
          { title: "Laravel", href: "/laravel" },
          { title: "React", href: "/react" },
          { title: "Gatsby", href: "/gatsby" },
        ],
      },
      { title: "Quick Start Guide", href: "/quick-start-guide" },
      { title: "Project Structure", href: "/project-structure" },
    ],
  },
];

// const v1_2_2_ROUTES: EachRoute[] = [
//   {
//     title: "Getting Started",
//     href: "/getting-started",
//     noLink: true,
//     items: [
//       { title: "Introduction", href: "/introduction" },
//       {
//         title: "Installation",
//         href: "/installation",
//         items: [
//           { title: "Laravel", href: "/laravel" },
//           { title: "React", href: "/react" },
//           { title: "Gatsby", href: "/gatsby" },
//         ],
//       },
//       { title: "Quick Start Guide", href: "/quick-start-guide" },
//       { title: "Changelog", href: "/changelog" },
//     ],
//   },
//   {
//     title: "React Hooks",
//     href: "/react-hooks",
//     noLink: true,
//     items: [
//       { title: "useFetch", href: "/use-fetch" },
//       { title: "useAuth", href: "/use-auth" },
//       { title: "useProduct", href: "/use-product" },
//       { title: "useOrder", href: "/use-order" },
//       { title: "useCart", href: "/use-cart" },
//       { title: "usePayment", href: "/use-payment" },
//       { title: "useShipping", href: "/use-shipping" },
//       { title: "useNotification", href: "/use-notification" },
//       { title: "useReview", href: "/use-review" },
//       { title: "useInventory", href: "/use-inventory" },
//       { title: "useUser", href: "/use-user" },
//       { title: "useSettings", href: "/use-settings" },
//       { title: "useData", href: "/use-data" },
//     ],
//   },
// ];

// const v2_3_6_ROUTES: EachRoute[] = [
//   {
//     title: "Getting Started",
//     href: "/getting-started",
//     noLink: true,
//     items: [
//       { title: "Introduction", href: "/introduction" },
//       {
//         title: "Installation",
//         href: "/installation",
//         items: [
//           { title: "Laravel", href: "/laravel" },
//           { title: "React", href: "/react" },
//           { title: "Gatsby", href: "/gatsby" },
//         ],
//       },
//       { title: "Quick Start Guide", href: "/quick-start-guide" },
//       {
//         title: "Project Structure",
//         href: "/project-structure",
//         items: [
//           { title: "Layouts", href: "/layouts" },
//           { title: "Integrations", href: "/integrations" },
//           {
//             title: "Manual",
//             href: "/manual",
//             items: [
//               { title: "JavaScript", href: "/javascript" },
//               { title: "Typescript", href: "/typescript" },
//               { title: "Golang", href: "/golang" },
//             ],
//           },
//         ],
//       },
//       { title: "Changelog", href: "/changelog" },
//       {
//         title: "FAQ",
//         href: "/faq",
//       },
//     ],
//   },
//   {
//     title: "Server Actions",
//     href: "/server-actions",
//     noLink: true,
//     items: [
//       { title: "getSession", href: "/getSession" },
//       { title: "getToken", href: "/getToken" },
//     ],
//   },
// ];

type Page = { title: string; href: string };

function getRecurrsiveAllLinks(node: EachRoute): Page[] {
  const ans: Page[] = [];
  if (!node.noLink) {
    ans.push({ title: node.title, href: node.href });
  }
  node.items?.forEach((subNode) => {
    const temp = { ...subNode, href: `${node.href}${subNode.href}` };
    ans.push(...getRecurrsiveAllLinks(temp));
  });
  return ans;
}

export function getRoutesFlatten(): Page[] {
  return ROUTES.map((route: EachRoute) => getRecurrsiveAllLinks(route)).flat();
}

export function getPreviousNext(path: string): { prev: Page | undefined; next: Page | undefined } {
  path = path.split("/").slice(1).join("/");
  const routes = getRoutesFlatten();
  const index = routes.findIndex((route: Page) => route.href === `/${path}`);
  return {
    prev: routes[index - 1],
    next: routes[index + 1],
  };
}

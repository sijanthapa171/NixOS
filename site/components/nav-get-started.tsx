"use client";

import { getRoutesFlatten, currentVersion } from "@/lib/routes-config";
import Anchor from "./anchor";

export default function NavGetStarted() {
  const routes = getRoutesFlatten();
  return (
    <Anchor
      activeClassName="text-primary font-semibold"
      href={`/docs/${currentVersion}${routes[0].href}`}
    >
      Documentation
    </Anchor>
  );
}

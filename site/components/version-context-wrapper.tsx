"use client";

import dynamic from "next/dynamic";
import { PropsWithChildren } from "react";

const VersionProvider = dynamic(() => import("./context/version"), {
  ssr: false,
});

export default function VersionContextWrapper({ children }: PropsWithChildren) {
  return <VersionProvider>{children}</VersionProvider>;
}

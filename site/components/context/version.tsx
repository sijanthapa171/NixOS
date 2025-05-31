"use client";

import { currentVersion } from "@/lib/routes-config";
import { createContext, useContext } from "react";

type VersionContextType = {
  currentVersion: string;
};

const VersionContext = createContext<VersionContextType>({
  currentVersion,
});

export function useVersion() {
  return useContext(VersionContext);
}

export default function VersionProvider({ children }: { children: React.ReactNode }) {
  return (
    <VersionContext.Provider
      value={{
        currentVersion,
      }}
    >
      {children}
    </VersionContext.Provider>
  );
}

"use client";

import { buttonVariants } from "@/components/ui/button";
import { getRoutesFlatten } from "@/lib/routes-config";
import { useToast } from "@/components/ui/use-toast";
import Link from "next/link";
import { useVersion } from "./context/version";

export default function GetStarted() {
  const { toast } = useToast();
  const { currentVersion } = useVersion();
  const routes = getRoutesFlatten();

  const handleClick = () => {
    toast({
      title: "It's cooking...",
      duration: 2000,
    });
  };

  return (
    <Link
      href={`/docs/${currentVersion}${routes[0].href}`}
      className={buttonVariants({ className: "px-6", size: "lg" })}
      onClick={handleClick}
    >
      Get Started
    </Link>
  );
}

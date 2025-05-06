import Link from "next/link";
import { buttonVariants } from "./ui/button";
import { Star, HeartIcon, File } from "lucide-react";

export function Footer() {
  return (
    <footer className="border-t w-full h-16">
      <div className="container flex items-center sm:justify-between justify-center sm:gap-0 gap-4 h-full text-muted-foreground text-sm flex-wrap sm:py-0 py-3 max-sm:px-4">
        <div className="flex items-center gap-2">
          <Star className="sm:block hidden w-5 h-5 text-muted-foreground" />
          <Link
            className="px-0 underline underline-offset-2"
            href="https://github.com/authxt/NixOS"
          >
            Star on Github
          </Link>
        </div>

        <div className="gap-4 items-center hidden md:flex">
          <FooterButtons />
        </div>
      </div>
    </footer>
  );
}

export function FooterButtons() {
  return (
    <>
      <Link
        href="https://github.com/nisabmohd/Aria-Docs"
        className={buttonVariants({ variant: "outline", size: "sm" })}
      >
        <File className="h-4 w-4 mr-2 text-gray-500 fill-current" />
        Site credit : Aria Docs
      </Link>
    </>
  );
}

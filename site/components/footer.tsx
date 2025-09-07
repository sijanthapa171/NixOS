import Link from "next/link";
import { HeartIcon } from "lucide-react";
import { buttonVariants } from "./ui/button";

export function FooterButtons() {
  return (
    <div className="flex items-center gap-3">
      <Link
        href="https://github.com/authxt/NixOS"
        target="_blank"
        className={buttonVariants({
          variant: "outline",
          size: "sm",
        })}
      >
        GitHub
      </Link>
    </div>
  );
}

export function Footer() {
  return (
    <footer className="border-t w-full h-16">
      <div className="container flex items-center sm:justify-between justify-center sm:gap-0 gap-4 h-full text-muted-foreground text-sm flex-wrap sm:py-0 py-3 max-sm:px-4">
        <div className="flex items-center gap-3">
          <HeartIcon className="sm:block hidden w-5 h-5 text-pink-500 fill-current" />
          <p className="text-center">
            Build by{" "}
            <Link
              className="px-1 underline underline-offset-2 text-pink-500"
              href="https://github.com/sijanthapa171"
            >
              sijan
            </Link>
            . The source code is available on{" "}
            <Link
              className="px-1 underline underline-offset-2"
              href="https://github.com/sijanthapa171/NixOS"
            >
              GitHub
            </Link>
            .
          </p>
        </div>
      </div>
    </footer>
  );
}


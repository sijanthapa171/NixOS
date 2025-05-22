import { buttonVariants } from "@/components/ui/button";
import { MoveUpRightIcon, TerminalIcon } from "lucide-react";
import Link from "next/link";
import GetStarted from "../components/get-started";
import Image from "next/image";
export default function Home() {
  return (
    <div className="flex sm:min-h-[91vh] min-h-[88vh] flex-col items-center justify-center text-center px-2 py-8">
      <Image
        src="/main.png"
        alt="NixOS Logo"
        width={1920}
        height={1080}
        quality={100}
        priority
        className="object-contain mt-4 rounded-lg max-w-[90vw] w-[1200px]"
      />

      <h1 className="text-3xl font-bold mb-4 sm:text-7xl mt-8">
        A guide to build <Link href="https://github.com/authxt/" className="text-pink-600 underline hover:text-pink-500">Auth X</Link> nixos configuration
      </h1>

      <div className="flex flex-row items-center gap-5 mt-6">
        <GetStarted />
        <Link
          href="https://github.com/authxt"
          className={buttonVariants({
            variant: "outline",
            className: "px-6",
            size: "lg",
          })}
        >
          GitHub
        </Link>
      </div>
    </div>
  );
}

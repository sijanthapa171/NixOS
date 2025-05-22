import Image from "next/image";

export function Footer() {
  return (
    <footer className="w-full py-6 border-t">
      <div className="container flex flex-col items-center gap-4">
        <Image
          src="/public-og.png"
          alt="Footer Logo"
          width={100}
          height={40}
          className="object-contain"
        />
        <p className="text-sm text-muted-foreground">
          © {new Date().getFullYear()} NixOS Configuration. All rights reserved.
        </p>
      </div>
    </footer>
  );
} 
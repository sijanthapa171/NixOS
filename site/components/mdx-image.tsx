"use client";

import Image from "next/image";
import { cn } from "@/lib/utils";

interface MdxImageProps {
  src: string;
  alt: string;
  width?: number;
  height?: number;
  className?: string;
}

export default function MdxImage({ 
  src, 
  alt, 
  width = 770, 
  height = 450,
  className 
}: MdxImageProps) {
  return (
    <div className="relative w-full">
      <Image
        src={src}
        alt={alt}
        width={width}
        height={height}
        priority
        quality={100}
        className={cn("mx-auto rounded-lg", className)}
      />
    </div>
  );
} 
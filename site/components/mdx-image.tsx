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
    <Image
      src={src}
      alt={alt}
      width={width}
      height={height}
      className={cn("rounded-lg", className)}
    />
  );
} 
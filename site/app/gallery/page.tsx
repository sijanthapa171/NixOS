import React from "react";
import { buttonVariants } from "@/components/ui/button";
import Link from "next/link";

interface GalleryImageProps {
  imageSrc: string;
  caption: string;
}

const GalleryImage: React.FC<GalleryImageProps> = ({ imageSrc, caption }) => (
  <figure className="mb-16 group">
    <div className="overflow-hidden rounded-xl bg-muted p-2 sm:p-4">
      <img
        src={imageSrc}
        alt={caption}
        className="w-full rounded-lg object-cover transform hover:scale-[1.01] transition-transform duration-300"
      />
    </div>
    <figcaption className="mt-3 text-center text-sm text-muted-foreground">
      {caption}
    </figcaption>
  </figure>
);

export default function Gallery() {
  const screenshots = [
    {
      imageSrc: "/gallery-01.png",
      caption: "lockscreen (hyprlock)",
    },
    {
      imageSrc: "/gallery-05.png",
      caption: "eww bar, neofetch, thunar",
    },
    {
      imageSrc: "/gallery-09.png",
      caption: "notification center",
    },
  ];

  return (
    <div className="min-h-[85vh] sm:min-h-[85.5vh] px-2 py-12 sm:py-8">
      <div className="mb-12">
        <h1 className="text-3xl font-bold mb-4 sm:text-5xl">
          .dotfiles <span className="text-gray-500">gallery</span>
        </h1>
        <div className="flex flex-row items-center gap-5 mt-8">
          <Link
            href="/docs/getting-started/installation"
            className={buttonVariants({
              className: "px-2 md:px-6",
              size: "lg",
            })}
          >
            Install Now
          </Link>
          <Link
            href="https://github.com/authxt/NixOS"
            className={buttonVariants({
              variant: "secondary",
              className: "px-4 md:px-6",
              size: "lg",
            })}
          >
            View on Github
          </Link>
        </div>
      </div>
      <div className="max-w-[1400px] mx-auto">
        {screenshots.map((screenshot, index) => (
          <GalleryImage key={index} {...screenshot} />
        ))}
      </div>
    </div>
  );
}

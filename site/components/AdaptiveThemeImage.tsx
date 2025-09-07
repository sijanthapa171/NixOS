import { cn } from "@/lib/utils";
import Image from "next/image";
import { ComponentProps } from "react";

type AdaptiveThemeImageProps = Exclude<ComponentProps<typeof Image>, "src"> & {
  src: {
    light: string;
    dark: string;
  };
};

export default function AdaptiveThemeImage({
  src: { dark, light },
  className,
  alt = "themed-img",
  width = 700,
  height = 400,
  ...rest
}: AdaptiveThemeImageProps) {
  return (
    <>
      <Image
        className={cn(className, "dark:hidden block")}
        src={light}
        alt={alt}
        width={width}
        height={height}
        {...rest}
      />
      <Image
        className={cn(className, "dark:block hidden")}
        src={dark}
        alt={alt}
        width={width}
        height={height}
        {...rest}
      />
    </>
  );
} 
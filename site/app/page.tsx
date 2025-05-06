import { buttonVariants } from "@/components/ui/button";
import { page_routes } from "@/lib/routes-config";
import {
  MoveUpRightIcon,
  TerminalSquareIcon,
  PaletteIcon,
  LayersIcon,
  MonitorIcon,
  GalleryVerticalEndIcon,
} from "lucide-react";
import Link from "next/link";

// Define the type for the props of FeatureCard
interface FeatureCardProps {
  icon: React.ComponentType<React.SVGProps<SVGSVGElement>>; // Icon should be a React component type (SVG-based)
  title: string;
  description: string;
}

// Define the FeatureCard component
const FeatureCard: React.FC<FeatureCardProps> = ({
  icon: Icon,
  title,
  description,
}) => (
  <div className="p-6 rounded-lg border bg-card text-card-foreground shadow-sm hover:shadow-md transition-shadow">
    <Icon className="w-8 h-8 mb-4 text-primary" />
    <h3 className="text-md font-semibold mb-2">{title}</h3>
    <p className="text-muted-foreground text-sm">{description}</p>
  </div>
);

export default function Home() {
  const features = [
    {
      icon: PaletteIcon,
      title: "Catppuccin Theme",
      description:
        "Beautiful Catppuccin Mocha color scheme integrated throughout the system for a cohesive look.",
    },
    {
      icon: LayersIcon,
      title: "Hyprland Setup",
      description:
        "Modern Wayland compositor configuration with smooth animations and efficient window management.",
    },
    {
      icon: TerminalSquareIcon,
      title: "Custom Shell",
      description:
        "Preconfigured shell environment with powerful aliases and productivity tools.",
    },
    {
      icon: MonitorIcon,
      title: "AGS Widgets",
      description:
        "Customizable widgets for system monitoring and control using Advanced GTK System.",
    },
    {
      icon: GalleryVerticalEndIcon,
      title: "Wallpaper Selector",
      description:
        "Easy-to-use wallpaper management system with dynamic switching capabilities.",
    },
    {
      icon: MoveUpRightIcon,
      title: "Keyboard Shortcuts",
      description:
        "Intuitive keyboard shortcuts for efficient workflow and window management.",
    },
  ];

  return (
    <div className="flex min-h-[85vh] sm:min-h-[85.5vh] flex-col justify-start px-2 py-12 sm:py-8">
      <h1 className="mb-4 text-3xl font-bold sm:text-5xl text-pink-600">
        Authxt <span className="text-gray-500">.dotfiles</span>
      </h1>
      <p className="mb-8 max-w-[800px] text-muted-foreground sm:text-xl">
        my bowl of rice 🍚, inspired by{" "}
        <a
          href="https://www.reddit.com/r/unixporn/"
          target="_blank"
          className="underline"
        >
          r/unixporn
        </a>
      </p>
      <div className="mb-16 flex flex-row items-center gap-5">
        <Link
          href={`/docs${page_routes[0].href}`}
          className={buttonVariants({ className: "px-6", size: "lg" })}
        >
          Get Started
        </Link>
        <Link
          href="#"
          className={buttonVariants({
            variant: "secondary",
            className: "px-6",
            size: "lg",
          })}
        >
          Blog
        </Link>
      </div>

      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
        {features.map((feature) => (
          <FeatureCard key={feature.title} {...feature} />
        ))}
      </div>
    </div>
  );
}

import type { Metadata } from "next";
import { ThemeProvider } from "@/components/contexts/theme-provider";
import { Navbar } from "@/components/navbar";
import { Inter } from "next/font/google";
import { Footer } from "@/components/footer";
import "@/styles/globals.css";

const InterMono = Inter({
  subsets: ["latin"],
  display: "swap",
  variable: "--font-inter-mono",
});

export const metadata: Metadata = {
  title: "Authxt's dotfiles",
  metadataBase: new URL("https://dotfiles.vercel.app/"),
  description: "documentation for my dotfiles repository",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body
        className={`${InterMono.variable} ${InterMono.variable} font-regular antialiased tracking-wide`}
        suppressHydrationWarning
      >
        <ThemeProvider
          attribute="class"
          defaultTheme="system"
          enableSystem
          disableTransitionOnChange
        >
          <Navbar />
          <main className="sm:container mx-auto w-[90vw] h-auto scroll-smooth">
            {children}
          </main>
          <Footer />
        </ThemeProvider>
      </body>
    </html>
  );
}

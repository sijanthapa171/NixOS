import type { Metadata } from "next";
import { ThemeProvider } from "@/components/theme-provider";
import { Navbar } from "@/components/navbar";
import { GeistSans } from "geist/font/sans";
import { GeistMono } from "geist/font/mono";
import { Footer } from "@/components/footer";
import "./globals.css";
import VersionContextWrapper from "@/components/version-context-wrapper";
import { Toaster } from "@/components/ui/toaster";

export const metadata: Metadata = {
  title: "SIJAN - NixOS setup guide",
  metadataBase: new URL("https://ariadocs.vercel.app/"),
  description:
    "This comprehensive documentation template, crafted with Next.js and available as open-source, delivers a sleek and responsive design, tailored to meet all your project documentation requirements.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body
        className={`${GeistSans.variable} ${GeistMono.variable} font-regular`}
        suppressHydrationWarning
      >
        <ThemeProvider
          attribute="class"
          defaultTheme="system"
          enableSystem
          disableTransitionOnChange
        >
          <VersionContextWrapper>
            <Navbar />
            <main className="sm:container mx-auto w-[88vw] h-auto">
              {children}
            </main>
            <Footer />
            <Toaster />
          </VersionContextWrapper>
        </ThemeProvider>
      </body>
    </html>
  );
}

import { Toaster } from "@/components/ui/sonner";
import "./globals.css";

export const metadata = {
  title: "Price Tracker - Never Miss a Price Drop",
  description:
    "Track product prices across e-commerce sites and get alerts on price drops",
};

export default function RootLayout({ child }) {
  return (
    <html lang="en">
      <body>
        {child}

        <Toaster richColors />
      </body>
    </html>
  );
}

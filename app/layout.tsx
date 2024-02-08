export const dynamic = "force-dynamic"; // this is the fix

"use client";

import "./globals.css";
import { Nunito } from "next/font/google";
import { ColorModeContext, useMode } from "./lib/theme";
import { ThemeProvider } from "@mui/material/styles";
import CssBaseline from "@mui/material/CssBaseline";

import NavBar from "./components/NavBar";
import Footer from "./components/Footer";
import { Box } from "./lib/mui";
import getCurrentUser from "./actions/getCurrentUser";
import NextAuthSessionsProvider from "./providers/SessionsProvider";
import React from "react";
const nunito = Nunito({ subsets: ["latin"] });

const metadata = {
  title: "Loctech",
  description: "Generated by create next app",
  content:  "device-width"  ,
  initialScale:"1",
  maximumScale: "1"
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const [theme, colorMode] = useMode();
  const [mount, setMount] = React.useState(false);
  React.useEffect(() => {
    setMount(true);
  });

  return (
    <html lang="en">
      <body className={nunito.className} suppressHydrationWarning={true}>
        <NextAuthSessionsProvider>
          {mount && (
            <ColorModeContext.Provider value={colorMode}>
              <ThemeProvider theme={theme}>
                <CssBaseline />
                <NavBar />
                {children}
                <Footer />
              </ThemeProvider>
            </ColorModeContext.Provider>
          )}
        </NextAuthSessionsProvider>
      </body>
    </html>
  );
}
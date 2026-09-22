"use client";
import Link from "next/link";
import Image from "next/image";

export function AdminHeader() {
  return (
    <header className="flex items-center justify-center px-4 py-3 bg-primary ">
      <Link href="/admin" className="flex items-center gap-2">
        <h2 className="text-xl font-bold tracking-tighter">FOOTMART</h2>
        <span className="text-sm md:text-lg px-2 py-0.5 rounded-md font-bold bg-secondary text-white tracking-tight">ADMIN</span>
      </Link>
     
    </header>
  );
}
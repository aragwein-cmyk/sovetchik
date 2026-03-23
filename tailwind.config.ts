import type { Config } from "tailwindcss";

export default {
  content: [
    "./app/**/*.{js,ts,jsx,tsx,mdx}",
    "./components/**/*.{js,ts,jsx,tsx,mdx}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["var(--font-sans)", "system-ui", "sans-serif"],
      },
      backgroundImage: {
        "gradient-brand": "linear-gradient(90deg, #007cf0 0%, #9333ea 100%)",
        "gradient-brand-soft":
          "linear-gradient(135deg, rgba(0,124,240,0.25) 0%, rgba(147,51,234,0.2) 100%)",
      },
      keyframes: {
        /** Целый шар слегка «плывёт» в пространстве */
        "siri-float": {
          "0%, 100%": { transform: "translate(0, 0)" },
          "20%": { transform: "translate(5px, -8px)" },
          "40%": { transform: "translate(-4px, -12px)" },
          "60%": { transform: "translate(-6px, -4px)" },
          "80%": { transform: "translate(3px, -7px)" },
        },
        /** Органическая форма, как у активной Siri */
        "siri-blob": {
          "0%, 100%": {
            borderRadius: "58% 42% 62% 38% / 48% 52% 48% 52%",
          },
          "33%": {
            borderRadius: "44% 56% 52% 48% / 55% 45% 58% 42%",
          },
          "66%": {
            borderRadius: "52% 48% 40% 60% / 42% 58% 48% 52%",
          },
        },
        /** Лёгкое «дыхание» размера */
        "siri-breathe": {
          "0%, 100%": { transform: "scale(1)" },
          "50%": { transform: "scale(1.045)" },
        },
        /** Цвета внутри шара медленно текут */
        "siri-flow": {
          "0%": { transform: "translate(-50%, -50%) rotate(0deg)" },
          "100%": { transform: "translate(-50%, -50%) rotate(360deg)" },
        },
        /** Мягкое свечение вокруг */
        "siri-aura": {
          "0%, 100%": { opacity: "0.45", transform: "scale(1)" },
          "50%": { opacity: "0.75", transform: "scale(1.12)" },
        },
      },
      animation: {
        "siri-float": "siri-float 12s ease-in-out infinite",
        "siri-blob": "siri-blob 8s ease-in-out infinite",
        "siri-breathe": "siri-breathe 5s ease-in-out infinite",
        "siri-flow": "siri-flow 14s linear infinite",
        "siri-aura": "siri-aura 4.5s ease-in-out infinite",
      },
    },
  },
  plugins: [],
} satisfies Config;

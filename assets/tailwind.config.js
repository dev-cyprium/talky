module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      margin: {
        "-navigation": "-58px",
      },
    },
    fontFamily: {
      sans: ["Source Sans Pro"],
      body: ["Source Sans Pro"],
      display: ["Source Sans Pro"],
    },
  },
  variants: {
    extend: {},
  },
  plugins: [require("@tailwindcss/forms"), require("@tailwindcss/typography")],
};

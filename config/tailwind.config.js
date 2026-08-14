module.exports = {
    content: [
        "./public/*.html",
        "./app/helpers/**/*.rb",
        "./app/javascript/**/*.js",
        "./app/views/**/*.{erb,html,haml,slim}"
    ],
    theme: { extend: {} },
    plugins: [require("@tailwindcss/typography")],
}
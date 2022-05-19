
clear

sudo rm -rf node_modules

npx create-react-app react-pwa --template cra-template-pwa-typescript

cd react-pwa

sudo rm -rf package-lock.json
sudo rm -rf node_modules

pnpm i

pnpm i -D @babel/core @babel/plugin-syntax-flow @babel/plugin-transform-react-jsx @testing-library/dom @testing-library/jest-dom @types/testing-library__jest-dom

pnpm start

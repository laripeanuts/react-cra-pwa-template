
clear

sudo rm -rf node_modules

npx create-react-app react-pwa --template cra-template-pwa-typescript

cd react-pwa

sudo rm -rf package-lock.json
sudo rm -rf node_modules

pnpm i

pnpm i -D @babel/core @babel/plugin-syntax-flow @babel/plugin-transform-react-jsx \
@testing-library/dom @testing-library/jest-dom @types/testing-library__jest-dom

pnpm i -D @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint eslint-config-prettier \
eslint-config-xo eslint-plugin-jest eslint-plugin-prettier eslint-plugin-react \
eslint-plugin-simple-import-sort prettier

echo "
node_modules
dist
" > .prettierignore

echo '
{
  "parser": "typescript",
  "singleQuote": true,
  "trailingComma": "all"
}
' > .prettierrc

echo '
{
    "env": {
        "browser": true,
        "es2021": true,
        "node": true,
        "jest": true,
        "jest/globals": true
    },
    "ignorePatterns": [
        "**/node_modules/**",
        "**/dist/**",
        "**/build/**",
        "node_modules"
    ],
    "extends": [
        "plugin:react/recommended",
        "xo",
        "plugin:prettier/recommended"
    ],
    "parser": "@typescript-eslint/parser",
    "settings": {
        "react": {
            "version": "detect"
        }
    },
    "parserOptions": {
        "ecmaFeatures": {
            "jsx": true
        },
        "ecmaVersion": "latest",
        "sourceType": "module"
    },
    "plugins": [
        "react",
        "@typescript-eslint",
        "simple-import-sort",
        "prettier",
        "jest"
    ],
    "rules": {
        "prettier/prettier": "error",
        "simple-import-sort/exports": "error",
        "simple-import-sort/imports": "error",
        "new-cap": "off",
        "capitalized-comments": "off",
        "no-unused-vars": "warn",
        "no-useless-constructor": "warn"
    }
}
' > .eslintrc.json

npx npe scripts.fix "pnpm run format && pnpm run lint:fix"
npx npe scripts.format "prettier --write **/src/**/*.ts"
npx npe scripts.lint "eslint src/**/*.ts"
npx npe scripts.lint:fix "eslint src/**/*.ts --fix"

pnpm start


clear

npx create-react-app react-pwa --template cra-template-pwa-typescript

cd react-pwa

sudo rm -rf package-lock.json
sudo rm -rf node_modules

pnpm i

# deepDevDependecies
pnpm i -D @babel/core @babel/plugin-syntax-flow @babel/plugin-transform-react-jsx \
@testing-library/dom @testing-library/jest-dom @types/testing-library__jest-dom

# Eslint e Prettier
pnpm i -D @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint eslint-config-prettier \
eslint-config-xo eslint-plugin-jest eslint-plugin-prettier eslint-plugin-react \
eslint-plugin-simple-import-sort prettier

# Outros
pnpm i - D npm install --save styled-components react-router-dom@6 react-is axios \
commitizen init cz-conventional-changelog --save-dev --save-exact

echo '
node_modules
dist
' > .prettierignore

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
npx npe scripts.format "prettier --write **/src/*.{ts,tsx,js,jsx,json,yaml}"
npx npe scripts.lint "eslint src/**/*.{ts,tsx,js,jsx}"
npx npe scripts.lint:fix "pnpm run lint --fix"
npx npe config.commitizen.path "cz-conventional-changelog"

printf '0a\n/* eslint-disable */\n.\nw\n' | ed src/serviceWorkerRegistration.ts
printf '0a\n/* eslint-disable */\n.\nw\n' | ed src/service-worker.ts

pnpm run lint:fix

mkdir src/assets src/components src/contexts src/hooks src/pages src/routes src/scripts src/services src/styles src/types src/utils

pnpm start

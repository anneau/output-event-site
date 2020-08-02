module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
  },
  parserOptions: {
    parser: 'babel-eslint',
  },
  extends: [
    '@nuxtjs',
    'prettier',
    'prettier/vue',
    'plugin:prettier/recommended',
    'plugin:nuxt/recommended',
  ],
  plugins: ['prettier'],
  // add your custom rules here
  rules: {
    'no-console': ['error', { allow: ['error'] }],
    'no-debugger': 1,
    'no-plusplus': ['error', { allowForLoopAfterthoughts: true }],
    camelcase: [0, { ignoreDestructuring: false }],
  },
}

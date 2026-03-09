// eslint.config.mjs
import antfu from "@antfu/eslint-config"

export default antfu({
  // 1. 基础格式化增强
  formatters: {
    html: true,
    css: true,
  },

  stylistic: {
    quotes: "double",
    indent: 2,
  },

  vue: {
    // 自动将多行属性折叠或展开，保持 Vue 模板整洁
    overrides: {
      "vue/max-attributes-per-line": ["error", {
        singleline: { max: 5 },
        multiline: { max: 1 },
      }],
      // 强制 Vue 组件内 top-level 元素的顺序 (script -> template -> style)
      "vue/block-order": ["error", {
        order: ["script", "template", "style"],
      }],
      // 自动对模板中的属性进行排序 (如 ref, v-if, v-for, class 的顺序)
      "vue/attributes-order": ["error", {
        alphabetical: false,
      }],
    },
  },

  // 针对 TS/JS 的额外实用规则
  rules: {
    // 允许在开发阶段使用 console.log (警告而非报错)
    "no-console": "warn",
  },

  // 自动检测 TypeScript 项目
  typescript: true,

})

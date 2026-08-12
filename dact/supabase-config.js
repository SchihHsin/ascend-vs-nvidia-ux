/*
 * 浏览器端仅使用 Supabase 的 Publishable / anon key。
 * 它不是 service_role key，绝不能把 service_role key 放到网页或仓库中。
 *
 * 在 Supabase Dashboard → Settings → API 中复制 Publishable（或 legacy anon）key，
 * 填入下方字符串后，参与者页面会启用 3 秒防抖的在线快照保存。
 */
window.DACT_SUPABASE = {
  url: 'https://yrivnkemmmtuthqqozwe.supabase.co',
  anonKey: 'sb_publishable_N6FryDo9v8Z-IvEYTNteIQ_UPaYoql9'
};

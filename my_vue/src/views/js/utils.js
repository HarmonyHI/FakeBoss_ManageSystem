export function say_hi_word() {
  return parseInt(Date().substring(16, 18)) >= 12 ? " 下午好" : " 上午好";
}
export function password_available(a, b) {
  if (a === "" || b === "") {
    return "输入不能为空";
  } else {
    if (a !== b) {
      return "两次输入密码不一致";
    } else if (a.length < 8) {
      return "密码过短";
    } else {
      return 1;
    }
  }
}
export function checkEmail(str) {
  return str.search("@") !== -1 && str.search("@") !== str.length - 1;
}

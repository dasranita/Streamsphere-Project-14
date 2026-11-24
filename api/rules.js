export function entitled(content,user,now=Date.now()){return content.published && (!content.premium || (user.expires && new Date(user.expires).getTime()>now)) ? true:false;}

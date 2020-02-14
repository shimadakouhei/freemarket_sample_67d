crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
end

crumb :registration do
  link "カード登録", new_card_path(current_user.id)
  parent :mypage
end
require '../articles_controller'

post :create, mymodel: params: { article: { title: "can create", body: "article successfully." } }
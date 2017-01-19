require 'selwet' # подключаем гем

class SelWeT::Unit # для написания тестов используется класс Unit
 
  set_browser :chrome # список браузеров, в которых будет производиться тестировние
  set_selenium_server_url 'http://127.0.0.1:4444/wd/hub' # адрес запущенного selenium server

    context "Habr" do
      should "1. Find habrahabr" do
        # перейти по ссылке 'https://www.google.ru/'
        Unit.followTheLink 'https://www.google.ru/'
        #заполняем и отправляем форму на странице поиска
        status, error = Unit.postForm 'form', {'[type="text"]'=>"habrahabr", 'button[name="btnG"]'=>:submit}
        # проверяем, что при заполнении и отправке формы не возникло ошибок
        assert_equal true, status, error
      end

      should "2. Open harbahabr" do
        # в новом окне открываем ссылку на хабр
        status, error = Unit.openInNewWindow '[href = "http://habrahabr.ru/"]'
        # закрываем окно с поисковиком
        Unit.closeWindow 0
        # проверяем, что при выполнении не вознилкло ошибок
        assert_equal true, status, error
        status, error = Unit.checkLocation 'http://habrahabr.ru/' # проверяем, что
        assert_equal true, status, error # текущая страница http://habrahabr.ru/
      end

      should "3. Click on first article" do
        # кликаем на заголовок первой статьи на хабре
        status, error = Unit.click "div.post:first-child a.post_title"
        # проверяем, что всё прошло успешно
        assert_equal true, status, error
      end

    end
 
end

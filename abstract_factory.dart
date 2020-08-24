abstract class WidgetFactory {
  Button getButton();
  Textbox getTextbox();
}

class WindowsWidgetFactory extends WidgetFactory {
  @override
  Button getButton() {
    return new WindowsButton();
  }

  @override
  Textbox getTextbox() {
    return new WindowsTextbox();
  }
}

class LinuxWidgetFactory extends WidgetFactory {
  @override
  Button getButton() {
    return new LinuxButton();
  }

  @override
  Textbox getTextbox() {
    return new LinuxTextbox();
  }
}

abstract class Widget {
  void draw();
}

abstract class Button implements Widget {}

abstract class Textbox implements Widget {}

class WindowsButton extends Button {
  @override
  void draw() {
    print('Drawing Windows Button');
  }
}

class WindowsTextbox extends Textbox {
  @override
  void draw() {
    print('Drawing Windows Textbox');
  }
}

class LinuxButton extends Button {
  @override
  void draw() {
    print('Drawing Linux Button');
  }
}

class LinuxTextbox extends Textbox {
  @override
  void draw() {
    print('Drawing Linux Textbox');
  }
}

enum Option { windows, linux }

WidgetFactory getWidgetFactory(Option option) {
  WidgetFactory widgetFactory;
  switch (option) {
    case Option.linux:
      widgetFactory = new LinuxWidgetFactory();
      break;
    case Option.windows:
      widgetFactory = new WindowsWidgetFactory();
      break;
    default:
  }
  return widgetFactory;
}

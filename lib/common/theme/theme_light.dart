part of 'theme.dart';

ThemeData themeLight = ThemeData(
  // adaptations: 用于应用程序自适应的适配属性。
  // applyElevationOverlayColor: 是否应用高程覆盖颜色。
  // cupertinoOverrideTheme: 用于自定义 Cupertino 风格的主题。
  // extensions: null, //用于扩展主题的扩展属性。
  // inputDecorationTheme: 定义输入框的样式和装饰。
  // materialTapTargetSize: 定义 Material 按钮的尺寸。
  // pageTransitionsTheme: 定义页面过渡动画的主题。
  platform: TargetPlatform.iOS, // 定义应用程序的目标平台。
  // scrollbarTheme: 定义滚动条的样式。
  // splashFactory: 定义水波纹效果的工厂。
  useMaterial3: true, // 是否使用 Material 3.0 样式。
  // visualDensity: 定义布局的视觉密度。
  brightness: Brightness.light, // 控制主题的亮度。
  // canvasColor: 画布的颜色。
  // cardColor: 卡片的颜色。
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light, // 控制亮度。
    // primary: 主要颜色，通常用于按钮、文本链接等。
    // onPrimary: 主要颜色上的文本颜色。
    // primaryContainer: 主要颜色的容器背景色。
    // onPrimaryContainer: 主要颜色容器上的文本颜色。
    // secondary: 次要颜色，通常用于选项卡、进度指示器等。
    // onSecondary: 次要颜色上的文本颜色。
    // secondaryContainer: 次要颜色的容器背景色。
    // onSecondaryContainer: 次要颜色容器上的文本颜色。
    // tertiary: 第三颜色，可用于其他组件。
    // onTertiary: 第三颜色上的文本颜色。
    // tertiaryContainer: 第三颜色的容器背景色。
    // onTertiaryContainer: 第三颜色容器上的文本颜色。
    // error: 错误颜色，通常用于错误提示。
    // onError: 错误颜色上的文本颜色。
    // errorContainer: 错误颜色的容器背景色。
    // onErrorContainer: 错误颜色容器上的文本颜色。
    // background: 背景颜色。
    // onBackground: 背景颜色上的文本颜色。
    // surface: 表面颜色，通常用于卡片、对话框等。
    // onSurface: 表面颜色上的文本颜色。
    // surfaceVariant: 表面颜色的变体。
    // onSurfaceVariant: 表面颜色变体上的文本颜色。
    // outline: 边框颜色。
    // outlineVariant: 边框颜色的变体。
    // shadow: 阴影颜色。
    // scrim: 遮罩颜色。
    // inverseSurface: 反转表面颜色。
    // onInverseSurface: 反转表面颜色上的文本颜色。
    // inversePrimary: 反转主要颜色。
    // surfaceTint: 表面颜色的着色。
  ), // 定义应用程序的颜色方案。
  // colorSchemeSeed: 定义颜色方案的种子。
  // dialogBackgroundColor: 对话框的背景颜色。
  // disabledColor: 禁用状态的颜色。
  // dividerColor: 分隔线的颜色。
  // focusColor: 获取焦点时的颜色。
  // highlightColor: 高亮时的颜色。
  // hintColor: 提示文本的颜色。
  // hoverColor: 悬停时的颜色。
  // indicatorColor: 指示器的颜色。
  primaryColor: Colors.pink, // 主要颜色。
  // primaryColorDark: 主要颜色的深色。
  // primaryColorLight: 主要颜色的浅色。
  // primarySwatch: 主颜色的颜色样本。
  // scaffoldBackgroundColor: Scaffold 组件的背景颜色。
  // secondaryHeaderColor: 次要标题的颜色。
  // shadowColor: 阴影的颜色。
  // splashColor: 水波纹效果的颜色。
  // unselectedWidgetColor: 未选中的小部件的颜色。
  // fontFamily: 默认字体。
  // fontFamilyFallback: 字体回退列表。
  // package: 字体资源的包名。
  // iconTheme: 图标的样式。
  // primaryIconTheme: 主要图标的样式。
  // primaryTextTheme: 主要文本的样式。
  textTheme: const TextTheme(
    // displayLarge：用于显示大标题的文本样式。
    // displayMedium：用于显示中等大小标题的文本样式。
    // displaySmall：用于显示小标题的文本样式。
    // headlineLarge：用于大标题的文本样式。
    // headlineMedium：用于中等大小标题的文本样式。
    // headlineSmall：用于小标题的文本样式。
    // titleLarge：用于大标题的文本样式。
    // titleMedium：用于中等大小标题的文本样式。
    // titleSmall：用于小标题的文本样式。
    bodyLarge: TextStyle(
      // inherit（继承）：是否继承父级组件的文本样式。默认为 true。
      color: Colors.black, //（颜色）：文本的颜色。
      // backgroundColor（背景颜色）：文本的背景颜色。
      fontSize: 16, //（字体大小）：文本的字体大小。
      // fontWeight（字体粗细）：文本的字体粗细，使用 FontWeight 枚举类来指定，例如 FontWeight.bold 表示粗体。
      // fontStyle（字体样式）：文本的字体样式，使用 FontStyle 枚举类来指定，例如 FontStyle.italic 表示斜体。
      // letterSpacing（字母间距）：字母之间的间距。
      // wordSpacing（单词间距）：单词之间的间距。
      // textBaseline（文本基线）：文本基线的对齐方式，使用 TextBaseline 枚举类来指定，例如 TextBaseline.alphabetic 表示按照字母基线对齐。
      height: 0, //（行高）：行高，指定文本行与行之间的距离。
      // leadingDistribution（行高分布方式）：行高的分布方式，使用 TextLeadingDistribution 枚举类来指定，例如 TextLeadingDistribution.even 表示均匀分布。
      // locale（区域设置）：用于本地化的区域设置。
      // foreground（前景色）：文本的前景色，使用 Paint 类来指定。
      // background（背景色）：文本的背景色，使用 Paint 类来指定。
      // shadows（阴影效果）：文本的阴影效果，使用 Shadow 类的列表来指定。
      // fontFeatures（字体特征）：字体的特征，使用 FontFeature 类的列表来指定。
      // fontVariations（字体变体）：字体的变体，使用 FontVariation 类的列表来指定。
      // decoration（装饰效果）：应用于文本的装饰效果，使用 TextDecoration 枚举类来指定，例如 TextDecoration.underline 表示下划线。
      // decorationColor（装饰效果颜色）：文本装饰效果的颜色。
      // decorationStyle（装饰效果样式）：文本装饰效果的样式，使用 TextDecorationStyle 枚举类来指定，例如 TextDecorationStyle.dashed 表示虚线。
      // decorationThickness（装饰效果厚度）：文本装饰效果的厚度。
      // debugLabel（调试标签）：用于调试的标签。
      // fontFamily（字体族）：文本的字体族。
      // fontFamilyFallback（字体族备选项）：字体族的备选项。
      // package（字体所在的包名）：字体所在的包名。
      // overflow（溢出处理方式）：当文本溢出容器时的处理方式，使用 TextOverflow 枚举类来指定，例如 TextOverflow.ellipsis 表示使用省略号处理溢出的文本。
    ), // 标题文本的样式。
    // bodyMedium：用于中等大小正文的文本样式。
    // bodySmall：用于小型正文的文本样式。
    // labelLarge：用于大型标签的文本样式。
    // labelMedium：用于中等大小标签的文本样式。
    // labelSmall：用于小型标签的文本样式。
    // headline1：用于标题1的文本样式。
    // headline2：用于标题2的文本样式。
    // headline3：用于标题3的文本样式。
    // headline4：用于标题4的文本样式。
    // headline5：用于标题5的文本样式。
    // headline6：用于标题6的文本样式。
    // subtitle1：用于副标题1的文本样式。
    // subtitle2：用于副标题2的文本样式。
    // bodyText1：用于正文文本1的文本样式。弃用
    // bodyText2：用于正文文本2的文本样式。弃用
    // caption：用于注释文本的文本样式。
    // button：用于按钮文本的文本样式。
    // overline：用于上划线文本的文本样式。
  ), // 文本的样式。
  // typography: 字体排版。
  // actionIconTheme: 操作图标的样式。
  appBarTheme: const AppBarTheme(
    // color: Colors.red, // AppBar的主题颜色,和 background 只能一个
    // backgroundColor: Colors.green, // AppBar的背景颜色。
    // foregroundColor: AppBar的前景颜色，例如标题和图标的颜色。
    elevation: 0, // AppBar的高度，用于控制AppBar的阴影大小。
    // scrolledUnderElevation: AppBar滚动下的elevation。
    // shadowColor: AppBar的阴影颜色。
    // surfaceTintColor: AppBar的表面颜色。
    // shape: AppBar的形状。
    // iconTheme: AppBar上的图标主题，例如返回按钮和菜单按钮的颜色、大小等。
    // actionsIconTheme: AppBar上的操作图标主题，例如在AppBar右侧放置的图标按钮。
    centerTitle: true, // 标题是否居中显示。
    // titleSpacing: 标题两侧的间距。
    // toolbarHeight: 工具栏的高度。
    // toolbarTextStyle: 工具栏文本的样式。
    titleTextStyle: TextStyle(
      // inherit（继承）：是否继承父级组件的文本样式。默认为 true。
      color: Colors.black, //（颜色）：文本的颜色。
      // backgroundColor（背景颜色）：文本的背景颜色。
      fontSize: 20, //（字体大小）：文本的字体大小。
      // fontWeight（字体粗细）：文本的字体粗细，使用 FontWeight 枚举类来指定，例如 FontWeight.bold 表示粗体。
      // fontStyle（字体样式）：文本的字体样式，使用 FontStyle 枚举类来指定，例如 FontStyle.italic 表示斜体。
      // letterSpacing（字母间距）：字母之间的间距。
      // wordSpacing（单词间距）：单词之间的间距。
      // textBaseline（文本基线）：文本基线的对齐方式，使用 TextBaseline 枚举类来指定，例如 TextBaseline.alphabetic 表示按照字母基线对齐。
      height: 0, //（行高）：行高，指定文本行与行之间的距离。
      // leadingDistribution（行高分布方式）：行高的分布方式，使用 TextLeadingDistribution 枚举类来指定，例如 TextLeadingDistribution.even 表示均匀分布。
      // locale（区域设置）：用于本地化的区域设置。
      // foreground（前景色）：文本的前景色，使用 Paint 类来指定。
      // background（背景色）：文本的背景色，使用 Paint 类来指定。
      // shadows（阴影效果）：文本的阴影效果，使用 Shadow 类的列表来指定。
      // fontFeatures（字体特征）：字体的特征，使用 FontFeature 类的列表来指定。
      // fontVariations（字体变体）：字体的变体，使用 FontVariation 类的列表来指定。
      // decoration（装饰效果）：应用于文本的装饰效果，使用 TextDecoration 枚举类来指定，例如 TextDecoration.underline 表示下划线。
      // decorationColor（装饰效果颜色）：文本装饰效果的颜色。
      // decorationStyle（装饰效果样式）：文本装饰效果的样式，使用 TextDecorationStyle 枚举类来指定，例如 TextDecorationStyle.dashed 表示虚线。
      // decorationThickness（装饰效果厚度）：文本装饰效果的厚度。
      // debugLabel（调试标签）：用于调试的标签。
      // fontFamily（字体族）：文本的字体族。
      // fontFamilyFallback（字体族备选项）：字体族的备选项。
      // package（字体所在的包名）：字体所在的包名。
      // overflow（溢出处理方式）：当文本溢出容器时的处理方式，使用 TextOverflow 枚举类来指定，例如 TextOverflow.ellipsis 表示使用省略号处理溢出的文本。
    ), // 标题文本的样式。
    // systemOverlayStyle: 系统UI覆盖样式，例如状态栏和导航栏的颜色。
  ), // AppBar 的主题。
  // badgeTheme: 徽章的主题。
  // bannerTheme: MaterialBanner 的主题。
  // bottomAppBarTheme: BottomAppBar 的主题。
  // bottomNavigationBarTheme: BottomNavigationBar 的主题。
  // bottomSheetTheme: BottomSheet 的主题。
  // buttonBarTheme: ButtonBar 的主题。
  // buttonTheme: const ButtonThemeData(
  //   // textTheme：按钮文本的样式主题，使用 ButtonTextTheme 枚举类来指定，默认为 ButtonTextTheme.normal。
  //   // minWidth: 120, // 按钮的最小宽度，默认为 88.0。
  //   // height: 40, // 按钮的高度，默认为 36.0。
  //   // padding：按钮的内边距，默认为 null，使用 EdgeInsetsGeometry 类来指定。
  //   // shape：按钮的形状，默认为 null，使用 ShapeBorder 类来指定。
  //   // layoutBehavior：按钮布局行为，默认为 ButtonBarLayoutBehavior.padded，使用 ButtonBarLayoutBehavior 枚举类来指定。
  //   // alignedDropdown：是否将下拉菜单与按钮对齐，默认为 false。
  //   // buttonColor: Colors.green, // 按钮的颜色，默认为 null，使用 Color 类来指定。
  //   // disabledColor：禁用状态下按钮的颜色，默认为 null，使用 Color 类来指定。
  //   // focusColor：按钮获取焦点时的颜色，默认为 null，使用 Color 类来指定。
  //   // hoverColor：鼠标悬停在按钮上时的颜色，默认为 null，使用 Color 类来指定。
  //   // highlightColor：按钮按下时的颜色，默认为 `null，使用 Color` 类来指定。
  //   // splashColor：按钮水波纹效果的颜色，默认为 null，使用 Color 类来指定。
  //   // colorScheme：按钮的颜色方案，默认为 null，使用 ColorScheme 类来指定。
  //   // materialTapTargetSize：按钮的点击目标大小，默认为 null，使用 MaterialTapTargetSize 枚举类来指定。
  // ), // 按钮的主题。
  // cardTheme: 卡片的主题。
  // checkboxTheme: 复选框的主题。
  // chipTheme: 芯片的主题。
  // dataTableTheme: DataTable 的主题。
  // datePickerTheme: DatePicker 的主题。
  // dialogTheme: 对话框的主题。
  // dividerTheme: 分隔线的主题。
  // drawerTheme: 抽屉的主题。
  // dropdownMenuTheme: 下拉菜单的主题。
  // elevatedButtonTheme: ElevatedButton 的主题。
  // expansionTileTheme: ExpansionTile 的主题。
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            // 按钮按下时的文本样式
            return const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              height: 0,
            );
          } else if (states.contains(MaterialState.disabled)) {
            // 按钮禁用时的文本样式
            return const TextStyle(
              fontSize: 14,
              height: 0,
            );
          }
          // 默认的按钮文本样式
          return const TextStyle(
            fontSize: 14,
            height: 0,
          );
        },
      ), // 按钮文本的样式，使用 MaterialStateProperty<TextStyle?> 类来指定。
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            // 按钮按下时的背景颜色
            return Colors.red;
          } else if (states.contains(MaterialState.disabled)) {
            // 按钮禁用时的背景颜色
            return Colors.grey;
          }
          // 默认的按钮背景颜色
          return Colors.blue;
        },
      ), // 按钮的背景颜色，使用 MaterialStateProperty<Color?> 类来指定。
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            // 按钮按下时的背景颜色
            return Colors.white;
          } else if (states.contains(MaterialState.disabled)) {
            // 按钮禁用时的背景颜色
            return Colors.grey;
          }
          // 默认的按钮背景颜色
          return Colors.white;
        },
      ), //按钮的前景颜色（文本颜色），使用 MaterialStateProperty<Color?> 类来指定。
      // overlayColor：按钮上的覆盖颜色（例如，按下时的颜色），使用 MaterialStateProperty<Color?> 类来指定。
      // shadowColor：按钮的阴影颜色，使用 MaterialStateProperty<Color?> 类来指定。
      // surfaceTintColor：按钮表面的着色颜色，使用 MaterialStateProperty<Color?> 类来指定。
      // elevation：按钮的高度，使用 MaterialStateProperty<double?> 类来指定。
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            // 按钮按下时的边距
            return const EdgeInsets.fromLTRB(40.0, 8.0, 40.0, 8.0);
          } else if (states.contains(MaterialState.disabled)) {
            // 按钮禁用时的边距
            return const EdgeInsets.fromLTRB(32.0, 4.0, 32.0, 4.0);
          }
          // 默认的按钮边距
          return const EdgeInsets.fromLTRB(32.0, 4.0, 32.0, 4.0);
        },
      ), // 按钮的内边距，使用 MaterialStateProperty<EdgeInsetsGeometry?> 类来指定。
      minimumSize: MaterialStateProperty.resolveWith<Size?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            // 按钮按下时的最小尺寸
            return const Size(164, 44);
          } else if (states.contains(MaterialState.disabled)) {
            // 按钮禁用时的最小尺寸
            return const Size(156, 36);
          }
          // 默认的按钮最小尺寸
          return const Size(160, 40);
        },
      ), // 按钮的最小尺寸，使用 MaterialStateProperty<Size?> 类来指定。
      // fixedSize:  // 按钮的固定尺寸，使用 MaterialStateProperty<Size?> 类来指定。
      maximumSize: MaterialStateProperty.resolveWith<Size?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            // 按钮按下时的最小尺寸
            return Size(Get.width - 40 + 4, 44);
          } else if (states.contains(MaterialState.disabled)) {
            // 按钮禁用时的最小尺寸
            return Size(Get.width - 40 - 4, 36);
          }
          // 默认的按钮最小尺寸
          return Size(Get.width - 40, 40);
        },
      ), // 按钮的最大尺寸，使用 MaterialStateProperty<Size?> 类来指定。
      // iconColor：按钮上图标的颜色，使用 MaterialStateProperty<Color?> 类来指定。
      // iconSize：按钮上图标的大小，使用 MaterialStateProperty<double?> 类来指定。
      // side：按钮的边框边线，使用 MaterialStateProperty<BorderSide?> 类来指定。
      // shape：按钮的形状，使用 MaterialStateProperty<OutlinedBorder?> 类来指定。
      // mouseCursor：鼠标指针的样式，使用 MaterialStateProperty<MouseCursor?> 类来指定。
      // visualDensity：按钮的视觉密度，使用 VisualDensity 类来指定。
      // tapTargetSize: MaterialTapTargetSize.padded, // 按钮的点击目标大小.
      // animationDuration: const Duration(milliseconds: 2000), // 按钮动画的持续时间
      // enableFeedback：是否启用按钮的触觉反馈，默认为 true。
      // alignment：按钮内容的对齐方式，使用 AlignmentGeometry 类来指定。
      // splashFactory：按钮水波纹效果的工厂，使用 InteractiveInkFeatureFactory 类来指定。
    ),
  ), // FilledButton 的主题。
  // floatingActionButtonTheme: FloatingActionButton 的主题。
  // iconButtonTheme: IconButton 的主题。
  // listTileTheme: ListTile 的主题。
  // menuBarTheme: MenuBar 的主题。
  // menuButtonTheme: MenuButton 的主题。
  // menuTheme: Menu 的主题。
  // navigationBarTheme: NavigationBar 的主题。
  // navigationDrawerTheme: NavigationDrawer 的主题。
  // navigationRailTheme: NavigationRail 的主题。
  // outlinedButtonTheme: OutlinedButton 的主题。
  // popupMenuTheme: PopupMenu 的主题。
  // progressIndicatorTheme: 进度指示器的主题。
  // radioTheme: 单选框的主题。
  // searchBarTheme: SearchBar 的主题。
  // searchViewTheme: SearchView 的主题。
  // segmentedButtonTheme: SegmentedButton 的主题。
  // sliderTheme: 滑块的主题。
  // snackBarTheme: SnackBar 的主题。
  // switchTheme: 开关的主题。
  // tabBarTheme: TabBar 的主题。
  // textButtonTheme: TextButton 的主题。
  // textSelectionTheme: 文本选择的主题。
  // timePickerTheme: TimePicker 的主题。
  // toggleButtonsTheme: ToggleButtons 的主题。
  // tooltipTheme: Tooltip 的主题。
  // toggleableActiveColor: 可切换小部件的激活颜色。
  // errorColor: 错误颜色。
  // backgroundColor: 背景颜色。
  // bottomAppBarColor: BottomAppBar 的颜色。
);

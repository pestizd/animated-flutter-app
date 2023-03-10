import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/info_card.dart';
import 'package:rive_animation/components/side_menu_tile.dart';
import 'package:rive_animation/models/rive_asset.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key, required this.onTap});

  final Function(String) onTap;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF3A98B9),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: 'Valere Margins',
                profession: 'Developers',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  'BROWSE',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white70,
                      ),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveOnInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI('active') as SMIBool;
                  },
                  press: () {
                    widget.onTap(menu.title);
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  'HISTORY',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white70,
                      ),
                ),
              ),
              ...sideMenu2.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveOnInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI('active') as SMIBool;
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

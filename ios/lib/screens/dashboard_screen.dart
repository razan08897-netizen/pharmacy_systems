import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // مصفوفة الشاشات المربوطة بالملفات الظاهرة في الصورة بالكامل
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'نقطة المبيعات',
        'subtitle': 'فواتير بيع سريعة',
        'icon': Icons.point_of_sale_rounded,
        'color': const Color(0xff0284c7),
        'route': '/sales', // sales_screen.dart
      },
      {
        'title': 'مرتجع المبيعات',
        'subtitle': 'إرجاع وتعديل الفواتير',
        'icon': Icons.assignment_return_rounded,
        'color': const Color(0xff0f766e),
        'route': '/sales_return', // Sale_Return_Screen.dart
      },
      {
        'title': 'المشتريات الجديدة',
        'subtitle': 'إدخال فواتير الموردين',
        'icon': Icons.add_business_rounded,
        'color': const Color(0xfff59e0b),
        'route': '/purchase', // purchase_screen.dart
      },
      {
        'title': 'مرتجع المشتريات',
        'subtitle': 'إرجاع بضاعة لمورد',
        'icon': Icons.keyboard_return_rounded,
        'color': const Color(0xffea580c),
        'route': '/purchase_return', // Purchase_Return_Screen.dart
      },
      {
        'title': 'جرد المخزن',
        'subtitle': 'متابعة كميات الأدوية',
        'icon': Icons.inventory_2_rounded,
        'color': const Color(0xff7c3aed),
        'route': '/inventory', // inventory_screen.dart
      },
      {
        'title': 'حركة الصندوق',
        'subtitle': 'إيرادات ومصروفات نقدية',
        'icon': Icons.account_balance_wallet_rounded,
        'color': const Color(0xff16a34a),
        'route': '/cash_balance', // cash_balance_screen.dart
      },
      {
        'title': 'ديون العملاء',
        'subtitle': 'حسابات الآجل للمشترين',
        'icon': Icons.group_remove_rounded,
        'color': const Color(0xffdb2777),
        'route': '/customer_debts', // Customer_Debts_Screen.dart
      },
      {
        'title': 'ديون الموردين',
        'subtitle': 'المستحقات للشركات',
        'icon': Icons.supervised_user_circle_rounded,
        'color': const Color(0xffdc2626),
        'route': '/supplier_debts', // Supplier_Debts_Screen.dart
      },
      {
        'title': 'كشف حساب',
        'subtitle': 'تقارير تفصيلية للحسابات',
        'icon': Icons.receipt_long_rounded,
        'color': const Color(0xff4b5563),
        'route': '/account_statement', // account_statement_screen.dart
      },
      {
        'title': 'التقارير الشاملة',
        'subtitle': 'الأرباح والخلاصة المالية',
        'icon': Icons.analytics_rounded,
        'color': const Color(0xff0d9488),
        'route': '/reports', // Unified_Report_Screen.dart
      },
      {
        'title': 'إعدادات النظام',
        'subtitle': 'تخصيص الصيدلية والأمان',
        'icon': Icons.settings_suggest_rounded,
        'color': const Color(0xff475569),
        'route': '/settings', // settings_screen.dart
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff8fafc), // خلفية هادئة ومريحة جداً للعين
      appBar: AppBar(
        title: const Text(
          "لوحة التحكم الشاملة",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff0f766e), // لون زيتي صيدلاني احترافي
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.verified_user_rounded,
                color: Color.fromARGB(255, 158, 158, 158)),
            onPressed: () => Navigator.pushNamed(
                context, '/activation'), // activation_screen.dart
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // جزء كروت الإحصائيات (الأرقام الذهبية المحدثة بصرياً)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  _buildStatCard("مبيعات اليوم", "0.00 \$",
                      const Color(0xff0284c7), Icons.trending_up_rounded),
                  const SizedBox(width: 12),
                  _buildStatCard("ديون العملاء", "0.00 \$",
                      const Color(0xffea580c), Icons.money_off_csred_rounded),
                ],
              ),
            ),
          ),

          // عنوان الأقسام
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              child: Text(
                "إدارة العمليات والأنظمة",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1e293b)),
              ),
            ),
          ),

          // شبكة الأزرار الذكية والسريعة
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1.1, // أبعاد مثالية لشاشات الموبايل
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = menuItems[index];
                  return InkWell(
                    onTap: () => Navigator.pushNamed(context, item['route']),
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                        border: Border.all(
                            color: const Color(0xfff1f5f9), width: 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: item['color'].withOpacity(0.12),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(item['icon'],
                                size: 28, color: item['color']),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            item['title'],
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1e293b)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item['subtitle'],
                            style: TextStyle(
                                fontSize: 11, color: Colors.grey[500]),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                childCount: menuItems.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // كارت الإحصائيات ذو التصميم الاحترافي
  Widget _buildStatCard(
      String title, String value, Color color, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xfff1f5f9), width: 1),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 8,
                offset: const Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(color: Colors.grey[500], fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                ],
              ),
            ),
            Icon(icon, color: color.withOpacity(0.4), size: 30),
          ],
        ),
      ),
    );
  }
}

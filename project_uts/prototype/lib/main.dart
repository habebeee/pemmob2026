import 'package:flutter/material.dart';

void main() => runApp(const VoltfixApp());

const blue = Color(0xFF1854D6);
const navy = Color(0xFF102344);
const bg = Color(0xFFF5F8FF);

class VoltfixApp extends StatelessWidget {
  const VoltfixApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Voltfix Mobile', debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: blue),
      scaffoldBackgroundColor: bg, appBarTheme: const AppBarTheme(backgroundColor: bg, foregroundColor: navy),
      inputDecorationTheme: InputDecorationTheme(filled: true, fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14))),
    home: const WelcomePage(),
  );
}

void go(BuildContext c, Widget p) => Navigator.of(c).push(MaterialPageRoute(builder: (_) => p));
void replace(BuildContext c, Widget p) => Navigator.of(c).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => p), (_) => false);

Widget pill(String label, {Color color = blue}) => Container(padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
  decoration: BoxDecoration(color: color.withOpacity(0.10), borderRadius: BorderRadius.circular(50)),
  child: Text(label, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: color)));
Widget panel({required Widget child}) => Container(width: double.infinity, padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(19), border: Border.all(color: const Color(0xFFE7EAF2))), child: child);
Widget heading(String s) => Padding(padding: const EdgeInsets.symmetric(vertical: 10), child: Text(s, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: navy)));
Widget action(String label, VoidCallback onPressed, {IconData? icon}) => SizedBox(width: double.infinity, height: 48,
  child: FilledButton.icon(onPressed: onPressed, icon: Icon(icon ?? Icons.arrow_forward), label: Text(label)));
Widget field(TextEditingController controller, String label, {int maxLines = 1, TextInputType? keyboard, bool secret = false}) =>
  Padding(padding: const EdgeInsets.only(bottom: 12), child: TextField(controller: controller, maxLines: maxLines,
    keyboardType: keyboard, obscureText: secret, decoration: InputDecoration(labelText: label)));

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override Widget build(BuildContext context) => Scaffold(body: SafeArea(child: Padding(
    padding: const EdgeInsets.all(26), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const CircleAvatar(radius: 40, backgroundColor: blue, child: Icon(Icons.bolt, color: Colors.white, size: 47)),
      const SizedBox(height: 14), const Text('VOLTFIX', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: navy)),
      const SizedBox(height: 12), const Text('Servis Elektronik Jadi Lebih Mudah', textAlign: TextAlign.center,
        style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800)),
      const SizedBox(height: 10), const Text('Ajukan servis, pantau perbaikan, dan terhubung dengan teknisi dalam satu aplikasi.', textAlign: TextAlign.center),
      const SizedBox(height: 35), action('Masuk', () => go(context, const LoginPage()), icon: Icons.login),
      const SizedBox(height: 10), OutlinedButton(onPressed: () => go(context, const RegisterPage()), child: const Text('Daftar Akun Pelanggan')),
      const SizedBox(height: 30), const Text('PROTOTIPE OFFLINE • Data contoh, belum tersambung Laravel',
        textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: Colors.grey))
    ]))));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController(), password = TextEditingController();
  @override void dispose() {email.dispose(); password.dispose(); super.dispose();}
  void login() {
    if (!email.text.contains('@') || password.text.isEmpty) {ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Isi email yang valid dan kata sandi.'))); return;}
    final e = email.text.trim().toLowerCase();
    final role = e.startsWith('teknisi@') ? 'teknisi' : e.startsWith('admin@') ? 'admin' : e.startsWith('manager@') ? 'manager' : 'pelanggan';
    replace(context, Shell(role: role));
  }
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(), body: SafeArea(child: ListView(padding: const EdgeInsets.all(24), children: [
    const Icon(Icons.bolt, size: 58, color: blue), const SizedBox(height: 15),
    const Text('Selamat Datang Kembali', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
    const Text('Masuk ke akun Voltfix Anda.'), const SizedBox(height: 24),
    field(email, 'Alamat Email', keyboard: TextInputType.emailAddress), field(password, 'Kata Sandi', secret: true),
    Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () => go(context, const ForgotPage()), child: const Text('Lupa Kata Sandi?'))),
    action('Masuk', login, icon: Icons.login),
    const SizedBox(height: 12), TextButton(onPressed: () => go(context, const RegisterPage()), child: const Text('Belum punya akun? Daftar Sekarang')),
    const SizedBox(height: 18), panel(child: const Text('MODE DEMO: masukkan password apa pun dan gunakan email pelanggan@demo.id, teknisi@demo.id, admin@demo.id, atau manager@demo.id untuk melihat tiap role. BUKAN login server.', style: TextStyle(fontSize: 12))),
  ])));
}
class RegisterPage extends StatefulWidget {const RegisterPage({super.key}); @override State<RegisterPage> createState() => _RegisterPageState();}
class _RegisterPageState extends State<RegisterPage> {
  final name=TextEditingController(), email=TextEditingController(), phone=TextEditingController(), pass=TextEditingController(), repeat=TextEditingController();
  @override void dispose() {for (final c in [name,email,phone,pass,repeat]) {c.dispose();} super.dispose();}
  @override Widget build(BuildContext c) => Scaffold(appBar: AppBar(title: const Text('Daftar Akun')), body: ListView(padding: const EdgeInsets.all(22), children: [
    heading('Buat Akun Voltfix'), const Text('Pendaftaran mandiri hanya untuk pelanggan.'), const SizedBox(height: 18),
    field(name,'Nama Lengkap'),field(email,'Email',keyboard:TextInputType.emailAddress),field(phone,'Nomor WhatsApp',keyboard:TextInputType.phone),field(pass,'Kata Sandi',secret:true),field(repeat,'Konfirmasi Kata Sandi',secret:true),
    action('Daftar Akun', () {if (name.text.isEmpty||!email.text.contains('@')||phone.text.isEmpty||pass.text.length<8||pass.text!=repeat.text) {
      ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content:Text('Lengkapi form, gunakan password min. 8 karakter dan konfirmasi yang sama.'))); return;}
      showDialog<void>(context:c,builder:(d)=>AlertDialog(title:const Text('Contoh Registrasi'),content:const Text('Form berhasil divalidasi secara lokal. Akun belum dibuat di server. Hubungkan REST API Laravel agar registrasi benar-benar bekerja.'),actions:[TextButton(onPressed:()=>Navigator.pop(d),child:const Text('Mengerti'))]));
    },icon:Icons.person_add),TextButton(onPressed:()=>go(c,const LoginPage()),child:const Text('Sudah punya akun? Masuk'))
  ]));
}
class ForgotPage extends StatelessWidget {const ForgotPage({super.key}); @override Widget build(BuildContext c) => Scaffold(appBar:AppBar(title:const Text('Lupa Kata Sandi')),body:Padding(padding:const EdgeInsets.all(24),child:Column(children:[const Text('Masukkan email untuk menerima tautan reset kata sandi.'),const SizedBox(height:20),TextField(decoration:InputDecoration(labelText:'Alamat Email')),const SizedBox(height:15),action('Kirim Tautan Reset',()=>ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content:Text('Mode demo: email belum dikirim. Integrasikan API reset password.'))),icon:Icons.mail_outline)])));
}

class Ticket {
  Ticket(this.invoice,this.category,this.brand,this.problem,this.address,this.date,this.slot,{this.status='PENDING'});
  final String invoice,category,brand,problem,address,date,slot;
  String status;
}
final tickets = <Ticket>[
  Ticket('INV-20250514-0042','Kulkas','Samsung Twin Cooling Plus','Freezer dingin tetapi bagian chiller tidak dingin.','Jl. Radio Dalam Raya, Gandaria Utara','14 Mei 2025','13.00 - 15.00',status:'ON_THE_WAY'),
  Ticket('INV-20250510-0019','TV','LG OLED 55 Inch','Layar bergaris dan panel bermasalah.','Depok, Jawa Barat','10 Mei 2025','08.00 - 10.00',status:'COMPLETED'),
];
String statusName(String s) => {'PENDING':'Menunggu Konfirmasi','WAITING_ASSIGNMENT':'Menunggu Penugasan','ASSIGNED':'Teknisi Ditugaskan','ON_THE_WAY':'Teknisi Menuju Lokasi','DIAGNOSIS':'Diagnosa','WAITING_PART':'Menunggu Suku Cadang','REPAIR':'Dalam Perbaikan','COMPLETED':'Selesai','CLOSED':'Ditutup','REJECTED':'Ditolak'}[s] ?? s;

class Shell extends StatefulWidget {const Shell({super.key,required this.role}); final String role; @override State<Shell> createState()=>_ShellState();}
class _ShellState extends State<Shell> {
 int selected=0;
 @override Widget build(BuildContext context) {
 final customer=widget.role=='pelanggan', tech=widget.role=='teknisi', manager=widget.role=='manager';
 final labels=customer?['Beranda','Tiket','Buat Tiket','Profil']:tech?['Beranda','Pekerjaan','Profil']:manager?['Ringkasan','Laporan','Teknisi','Profil']:['Ringkasan','Tiket','Teknisi','Profil'];
 final icons=customer?[Icons.home,Icons.receipt_long,Icons.add_circle,Icons.person]:tech?[Icons.home,Icons.build,Icons.person]:manager?[Icons.dashboard,Icons.bar_chart,Icons.engineering,Icons.person]:[Icons.dashboard,Icons.receipt_long,Icons.engineering,Icons.person];
 Widget content;
 if (selected==labels.length-1) {content=ProfileView(role:widget.role);} else if(customer) {content = selected==0?const CustomerHome():selected==1?const TicketsView():const NewTicketView();}
 else if(tech) {content=selected==2?ProfileView(role:widget.role):const TechnicianHome();}
 else if(manager) {content=selected==0?const SummaryView():selected==1?const ReportView():const TechniciansView();}
 else {content=selected==0?const SummaryView():selected==1?const AdminTicketsView():const TechniciansView();}
 return Scaffold(appBar:AppBar(title:Row(children:[const Icon(Icons.bolt,color:blue),const SizedBox(width:5),const Text('VOLTFIX',style:TextStyle(fontWeight:FontWeight.w900)),const Spacer(),Text(widget.role.toUpperCase(),style:const TextStyle(fontSize:11))])),
 body:content,bottomNavigationBar:NavigationBar(selectedIndex:selected,onDestinationSelected:(n)=>setState(()=>selected=n),destinations:[for(var i=0;i<labels.length;i++)NavigationDestination(icon:Icon(icons[i]),label:labels[i]) ]));
 }
}
class CustomerHome extends StatelessWidget {const CustomerHome({super.key}); @override Widget build(BuildContext c) => ListView(padding:const EdgeInsets.all(16),children:[
 const Text('Halo, Budi Santoso 👋',style:TextStyle(fontSize:21,fontWeight:FontWeight.w800)),const SizedBox(height:6),const Text('Peralatan elektronik bermasalah? Kami siap membantu.'),const SizedBox(height:14),
 Container(padding:const EdgeInsets.all(20),decoration:BoxDecoration(color:blue,borderRadius:BorderRadius.circular(22)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[const Text('Buat Tiket Servis',style:TextStyle(fontSize:22,color:Colors.white,fontWeight:FontWeight.w900)),const SizedBox(height:8),const Text('Jadwalkan kunjungan teknisi untuk perangkat elektronik Anda.',style:TextStyle(color:Colors.white)),const SizedBox(height:16),FilledButton(style:FilledButton.styleFrom(backgroundColor:Colors.white,foregroundColor:blue),onPressed:()=>go(c,const NewTicketStandalone()),child:const Text('Pesan Sekarang'))])),
 heading('Status Ringkasan'),Row(children:[for(final item in ['Total ${tickets.length}','Menunggu ${tickets.where((t)=>t.status=='PENDING').length}','Proses ${tickets.where((t)=>!['PENDING','COMPLETED','CLOSED','REJECTED'].contains(t.status)).length}'])Expanded(child:Padding(padding:const EdgeInsets.all(3),child:panel(child:Text(item,textAlign:TextAlign.center,style:const TextStyle(fontSize:12,fontWeight:FontWeight.w700))))) ]),
 heading('Kategori Perangkat'),Wrap(spacing:9,runSpacing:9,children:[for(final s in ['Kulkas','TV','Mesin Cuci'])pill(s)]),heading('Daftar Tiket Terkini'),...tickets.map((t)=>TicketTile(ticket:t)),const SizedBox(height:20),panel(child:const ListTile(leading:Icon(Icons.verified_user,color:blue),title:Text('Informasi Layanan'),subtitle:Text('Selalu verifikasi identitas teknisi sebelum proses servis.')))
 ]);}
class TicketsView extends StatelessWidget {const TicketsView({super.key}); @override Widget build(BuildContext c)=>ListView(padding:const EdgeInsets.all(16),children:[heading('Riwayat Tiket'),...tickets.map((t)=>TicketTile(ticket:t))]);}
class TicketTile extends StatelessWidget {const TicketTile({super.key,required this.ticket});final Ticket ticket;@override Widget build(BuildContext c)=>Padding(padding:const EdgeInsets.only(bottom:12),child:panel(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Row(children:[Expanded(child:Text(ticket.invoice,style:const TextStyle(fontWeight:FontWeight.bold))),pill(statusName(ticket.status))]),const SizedBox(height:10),Text('${ticket.category} • ${ticket.brand}',style:const TextStyle(fontWeight:FontWeight.w700)),Text(ticket.problem,maxLines:2,overflow:TextOverflow.ellipsis),const SizedBox(height:9),Text('${ticket.date} • ${ticket.slot}',style:const TextStyle(fontSize:12,color:Colors.grey)),const SizedBox(height:8),OutlinedButton(onPressed:()=>go(c,TicketDetail(ticket:ticket)),child:const Text('Lihat Detail'))])));}
class TicketDetail extends StatefulWidget {const TicketDetail({super.key,required this.ticket});final Ticket ticket;@override State<TicketDetail> createState()=>_TicketDetailState();}
class _TicketDetailState extends State<TicketDetail> {int stars=5; @override Widget build(BuildContext c) {final t=widget.ticket;return Scaffold(appBar:AppBar(title:const Text('Detail Tiket Reparasi')),body:ListView(padding:const EdgeInsets.all(16),children:[panel(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(t.invoice,style:const TextStyle(fontSize:18,fontWeight:FontWeight.w800)),const SizedBox(height:8),pill(statusName(t.status)),const SizedBox(height:12),Text('Jadwal: ${t.date}, ${t.slot}') ])),heading('Teknisi Bertugas'),panel(child:const ListTile(leading:CircleAvatar(child:Icon(Icons.engineering)),title:Text('Hendra Wijaya'),subtitle:Text('Teknisi Voltfix • Detail contoh'))),heading('Detail Perangkat & Gejala'),panel(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('${t.category} • ${t.brand}',style:const TextStyle(fontWeight:FontWeight.w800)),const SizedBox(height:8),Text(t.problem)])),heading('Alamat Servis'),panel(child:Text(t.address)),heading('Tahapan Pengerjaan'),panel(child:Column(children:[for(final s in ['PENDING','WAITING_ASSIGNMENT','ASSIGNED','ON_THE_WAY','DIAGNOSIS','REPAIR','COMPLETED','CLOSED'])ListTile(dense:true,leading:Icon(s==t.status?Icons.radio_button_checked:Icons.circle_outlined,color:s==t.status?blue:Colors.grey),title:Text(statusName(s)))])),if(t.status=='COMPLETED')... [heading('Beri Rating'),panel(child:Column(children:[Wrap(children:[for(var i=1;i<=5;i++)IconButton(onPressed:()=>setState(()=>stars=i),icon:Icon(i<=stars?Icons.star:Icons.star_border,color:Colors.amber))]),action('Kirim Ulasan',(){setState(()=>t.status='CLOSED');ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content:Text('Rating tersimpan secara lokal (demo).')));},icon:Icons.check)]))],const SizedBox(height:18)]));}}
class NewTicketStandalone extends StatelessWidget {const NewTicketStandalone({super.key});@override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Buat Tiket Servis')),body:const NewTicketView());}
class NewTicketView extends StatefulWidget {const NewTicketView({super.key});@override State<NewTicketView> createState()=>_NewTicketViewState();}
class _NewTicketViewState extends State<NewTicketView> {
 int step=0; String category='Mesin Cuci',slot='13.00 - 15.00';
 final brand=TextEditingController(),problem=TextEditingController(),address=TextEditingController(),district=TextEditingController(),city=TextEditingController(),postal=TextEditingController();
 DateTime date=DateTime.now().add(const Duration(days:1));
 @override void dispose(){for(final c in [brand,problem,address,district,city,postal]){c.dispose();}super.dispose();}
 String get dateLabel=>'${date.day.toString().padLeft(2,'0')}-${date.month.toString().padLeft(2,'0')}-${date.year}';
 void next(){if(step==0&&(brand.text.trim().isEmpty||problem.text.trim().isEmpty)||step==1&&(address.text.trim().isEmpty||district.text.trim().isEmpty||city.text.trim().isEmpty)) {ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Lengkapi semua kolom wajib.')));return;}if(step<3){setState(()=>step++);}else{final t=Ticket('INV-DEMO-${(tickets.length+1).toString().padLeft(4,'0')}',category,brand.text,problem.text,'${address.text}, ${district.text}, ${city.text}',dateLabel,slot);tickets.insert(0,t);showDialog<void>(context:context,builder:(d)=>AlertDialog(title:const Text('Tiket Demo Dibuat'),content:Text('${t.invoice}\nStatus: PENDING\n\nData hanya tersimpan dalam memori aplikasi. Tidak ada tiket yang dibuat di Laravel.'),actions:[TextButton(onPressed:(){Navigator.pop(d);setState(()=>step=0);},child:const Text('Mengerti'))]));}}
 @override Widget build(BuildContext c)=>ListView(padding:const EdgeInsets.all(18),children:[heading('Buat Pesanan Servis'),Text('Langkah ${step+1} dari 4',style:const TextStyle(color:blue,fontWeight:FontWeight.w700)),const SizedBox(height:8),LinearProgressIndicator(value:(step+1)/4,minHeight:7,borderRadius:BorderRadius.circular(20)),const SizedBox(height:22),
 if(step==0)...[heading('Perangkat & Masalah'),DropdownButtonFormField<String>(value:category,decoration:const InputDecoration(labelText:'Kategori Perangkat'),items:['Kulkas','TV','Mesin Cuci'].map((x)=>DropdownMenuItem(value:x,child:Text(x))).toList(),onChanged:(v)=>setState(()=>category=v!)),const SizedBox(height:12),field(brand,'Merek / Model Perangkat'),field(problem,'Deskripsi Kerusakan',maxLines:4)],
 if(step==1)...[heading('Alamat & Jadwal'),field(address,'Alamat Lengkap'),field(district,'Kecamatan'),field(city,'Kota/Kabupaten'),field(postal,'Kode Pos',keyboard:TextInputType.number),panel(child:ListTile(leading:const Icon(Icons.calendar_month,color:blue),title:const Text('Tanggal Kunjungan'),subtitle:Text(dateLabel),trailing:const Icon(Icons.edit_calendar),onTap:() async {final picked=await showDatePicker(context:c,initialDate:date,firstDate:DateTime.now(),lastDate:DateTime.now().add(const Duration(days:365)));if(picked!=null){setState(()=>date=picked);}})),const SizedBox(height:12),heading('Pilih Slot Waktu'),...['08.00 - 10.00','10.00 - 12.00','13.00 - 15.00','15.00 - 17.00'].map((s)=>RadioListTile<String>(title:Text('$s WIB'),value:s,groupValue:slot,onChanged:(v)=>setState(()=>slot=v!)))],
 if(step==2)...[heading('Foto Bukti Kerusakan'),panel(child:const Column(children:[Icon(Icons.add_a_photo_outlined,size:48,color:blue),SizedBox(height:9),Text('Unggah 1–5 foto (maksimum 2 MB per foto).'),SizedBox(height:7),Text('Belum aktif dalam prototipe. Integrasi kamera/galeri dan validasi server diperlukan.',textAlign:TextAlign.center,style:TextStyle(fontSize:12,color:Colors.grey))]))],
 if(step==3)...[heading('Konfirmasi Pesanan'),panel(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Kategori: $category'),Text('Perangkat: ${brand.text}'),Text('Masalah: ${problem.text}'),Text('Alamat: ${address.text}, ${district.text}, ${city.text}'),Text('Jadwal: $dateLabel, $slot WIB'),const SizedBox(height:9),const Text('Catatan: contoh lokal, tidak terkirim ke backend.',style:TextStyle(color:Colors.deepOrange))]))],
 const SizedBox(height:24),Row(children:[if(step>0)Expanded(child:OutlinedButton(onPressed:()=>setState(()=>step--),child:const Text('Kembali'))),if(step>0)const SizedBox(width:10),Expanded(child:FilledButton(onPressed:next,child:Text(step==3?'Buat Tiket Demo':'Lanjut')))])
 ]);
}
class TechnicianHome extends StatelessWidget {const TechnicianHome({super.key}); @override Widget build(BuildContext c)=>ListView(padding:const EdgeInsets.all(16),children:[heading('Dashboard Teknisi'),panel(child:const ListTile(leading:Icon(Icons.engineering,color:blue),title:Text('Halo, Hendra Wijaya'),subtitle:Text('Tugas aktif: 1 • Rating contoh: 4.9'))),heading('Pekerjaan Ditugaskan'),...tickets.where((t)=>!['CLOSED','REJECTED'].contains(t.status)).map((t)=>Padding(padding:const EdgeInsets.only(bottom:10),child:panel(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(t.invoice,style:const TextStyle(fontWeight:FontWeight.bold)),const SizedBox(height:8),Text('${t.category} • ${t.brand}'),const SizedBox(height:8),pill(statusName(t.status)),const SizedBox(height:10),action('Lihat Tugas',()=>go(c,TechnicianDetail(ticket:t)),icon:Icons.chevron_right)]))))]);}
class TechnicianDetail extends StatefulWidget {const TechnicianDetail({super.key,required this.ticket});final Ticket ticket;@override State<TechnicianDetail> createState()=>_TechnicianDetailState();}
class _TechnicianDetailState extends State<TechnicianDetail> {
 final note=TextEditingController(); @override void dispose(){note.dispose();super.dispose();}
 static const nextStatuses={'ASSIGNED':'ON_THE_WAY','ON_THE_WAY':'DIAGNOSIS','WAITING_PART':'REPAIR','REPAIR':'COMPLETED'};
 String? get next=>nextStatuses[widget.ticket.status];
 void update(String status){if(note.text.trim().isEmpty){ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Isi catatan teknis sebelum melanjutkan.')));return;}setState(()=>widget.ticket.status=status);note.clear();ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Status berubah pada data demo lokal, belum disimpan ke backend.')));}
 @override Widget build(BuildContext c){final t=widget.ticket;return Scaffold(appBar:AppBar(title:const Text('Detail Tugas Teknisi')),body:ListView(padding:const EdgeInsets.all(16),children:[panel(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(t.invoice,style:const TextStyle(fontSize:18,fontWeight:FontWeight.w800)),const SizedBox(height:8),pill(statusName(t.status))])),heading('Pelanggan'),panel(child:const ListTile(leading:Icon(Icons.person),title:Text('Ibu Ratna Dewi'),subtitle:Text('Kontak contoh • Integrasi WhatsApp belum tersedia'))),heading('Alamat Pengerjaan'),panel(child:Text(t.address)),heading('Detail Perangkat'),panel(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('${t.category}: ${t.brand}',style:const TextStyle(fontWeight:FontWeight.bold)),Text(t.problem)])),heading('Pembaruan Status Reparasi'),panel(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('Status saat ini: ${statusName(t.status)}'),const SizedBox(height:15),field(note,'Catatan Temuan Lapangan',maxLines:3),if(t.status=='DIAGNOSIS')...[action('Menunggu Suku Cadang',()=>update('WAITING_PART'),icon:Icons.inventory_2_outlined),const SizedBox(height:9),action('Mulai Perbaikan',()=>update('REPAIR'),icon:Icons.build)]else if(next!=null)action('Lanjut: ${statusName(next!)}',()=>update(next!),icon:Icons.check_circle_outline)else const Text('Tidak ada aksi lanjutan pada status ini.',style:TextStyle(color:Colors.grey))])),const SizedBox(height:12),const Text('DEMO: state disimpan di memori dan akan direset saat aplikasi dibuka ulang. Dalam production, seluruh transisi harus divalidasi Laravel.',style:TextStyle(fontSize:12,color:Colors.deepOrange))]));}
}
class SummaryView extends StatelessWidget {const SummaryView({super.key});@override Widget build(BuildContext c)=>ListView(padding:const EdgeInsets.all(16),children:[heading('Ringkasan Operasional'),...['Tiket Hari Ini','Menunggu Konfirmasi','Dalam Proses','Selesai Bulan Ini'].map((x)=>Padding(padding:const EdgeInsets.only(bottom:10),child:panel(child:ListTile(leading:const Icon(Icons.analytics,color:blue),title:Text(x),trailing:Text('${tickets.length}',style:const TextStyle(fontSize:21,fontWeight:FontWeight.w800)))))),heading('Aktivitas Terbaru'),...tickets.map((t)=>TicketTile(ticket:t))]);}
class AdminTicketsView extends StatefulWidget {const AdminTicketsView({super.key});@override State<AdminTicketsView> createState()=>_AdminTicketsViewState();}
class _AdminTicketsViewState extends State<AdminTicketsView>{void change(Ticket t,String s){setState(()=>t.status=s);ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('Perubahan lokal demo; belum dikirim ke server.')));} @override Widget build(BuildContext c)=>ListView(padding:const EdgeInsets.all(16),children:[heading('Antrian Tiket'),...tickets.map((t)=>Padding(padding:const EdgeInsets.only(bottom:12),child:panel(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(t.invoice,style:const TextStyle(fontWeight:FontWeight.bold)),Text(t.brand),const SizedBox(height:8),pill(statusName(t.status)),const SizedBox(height:12),if(t.status=='PENDING')Wrap(spacing:8,children:[FilledButton(onPressed:()=>change(t,'WAITING_ASSIGNMENT'),child:const Text('Setujui')),OutlinedButton(onPressed:(){final reason=TextEditingController();showDialog<void>(context:c,builder:(dialog)=>AlertDialog(title:const Text('Tolak Tiket'),content:TextField(controller:reason,decoration:const InputDecoration(labelText:'Alasan wajib')),actions:[TextButton(onPressed:()=>Navigator.pop(dialog),child:const Text('Batal')),FilledButton(onPressed:(){if(reason.text.trim().isNotEmpty){Navigator.pop(dialog);change(t,'REJECTED');}},child:const Text('Tolak'))]));},child:const Text('Tolak'))]),if(t.status=='WAITING_ASSIGNMENT')action('Tugaskan Teknisi Demo',()=>change(t,'ASSIGNED'),icon:Icons.assignment_ind),OutlinedButton(onPressed:()=>go(c,TicketDetail(ticket:t)),child:const Text('Detail'))]))))]);}
class ReportView extends StatelessWidget {const ReportView({super.key});@override Widget build(BuildContext c)=>ListView(padding:const EdgeInsets.all(16),children:[heading('Laporan Manajer'),panel(child:const Column(children:[Icon(Icons.bar_chart,size:95,color:blue),Text('Tren tiket 12 bulan',style:TextStyle(fontWeight:FontWeight.bold)),Text('Grafik production memerlukan endpoint laporan Laravel.',textAlign:TextAlign.center)])),heading('Performa Teknisi'),const TechniciansView(embed:true)]);}
class TechniciansView extends StatelessWidget {const TechniciansView({super.key,this.embed=false});final bool embed;@override Widget build(BuildContext c){final inner=[panel(child:const ListTile(leading:CircleAvatar(child:Icon(Icons.engineering)),title:Text('Hendra Wijaya'),subtitle:Text('Spesialis Kulkas • Tersedia'),trailing:Text('★ 4.9'))),const SizedBox(height:10),panel(child:const ListTile(leading:CircleAvatar(child:Icon(Icons.engineering)),title:Text('Rahmat Hidayat'),subtitle:Text('Spesialis Mesin Cuci • Tersedia'),trailing:Text('★ 4.8')))];return embed?Column(children:inner):ListView(padding:const EdgeInsets.all(16),children:[heading('Daftar Teknisi'),...inner]);}}
class ProfileView extends StatelessWidget {const ProfileView({super.key,required this.role});final String role;@override Widget build(BuildContext c)=>ListView(padding:const EdgeInsets.all(16),children:[heading('Profil Pengguna'),panel(child:ListTile(leading:const CircleAvatar(radius:27,child:Icon(Icons.person)),title:Text('Pengguna ${role.toUpperCase()}'),subtitle:Text('$role@demo.id\nMode demo offline'))),const SizedBox(height:18),panel(child:const ListTile(leading:Icon(Icons.security,color:blue),title:Text('Keamanan Akun'),subtitle:Text('Pengelolaan akun memerlukan backend Laravel.'))),const SizedBox(height:18),action('Keluar',()=>showDialog<void>(context:c,builder:(d)=>AlertDialog(title:const Text('Keluar dari Akun?'),content:const Text('Kembali ke layar awal Voltfix?'),actions:[TextButton(onPressed:()=>Navigator.pop(d),child:const Text('Batal')),FilledButton(onPressed:(){Navigator.pop(d);replace(c,const WelcomePage());},child:const Text('Ya, Keluar'))])),icon:Icons.logout)]);}

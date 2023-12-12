import 'package:calory_tracker/models/model.dart';
import 'package:m_widget/m_widget.dart';

late User currentUser;

// immutability
const appName = 'Calory Tracker';

// Function as first class citizen
typedef ExerciseCalculation = double Function(double weight, double time, double met);

// Higher-order function
double performExerciseCalculation({
  required double weight,
  required double time,
  double met = 7.0,
  required ExerciseCalculation calculation,
}) =>
    calculation(weight, time, met);

double countGeneralSports({required double weight, required double time, double met = 3.0}) => performExerciseCalculation(weight: weight, time: time, met: met, calculation: _exerciseCalculation);

double countIndividualExercise({required double weight, required double time, double met = 7.0}) => performExerciseCalculation(weight: weight, time: time, met: met, calculation: _exerciseCalculation);

// Pure function
double _exerciseCalculation(double weight, double time, double met) => time * (met * 3.5 * weight) / 200;

final Map<String, Map<LanguageType, String>> additionalCaloryTrackerData = {
  'This feature is still not available': {
    LanguageType.unitedStatesEnglish: 'This feature is still not available',
    LanguageType.indonesiaIndonesian: 'Fitur ini masih belum tersedia',
  },
  'Username': {
    LanguageType.unitedStatesEnglish: 'Username',
    LanguageType.indonesiaIndonesian: 'Username',
  },
  'Password': {
    LanguageType.unitedStatesEnglish: 'Password',
    LanguageType.indonesiaIndonesian: 'Kata sandi',
  },
  'Date of birth': {
    LanguageType.unitedStatesEnglish: 'Date of birth',
    LanguageType.indonesiaIndonesian: 'Tanggal lahir',
  },
  'Gender': {
    LanguageType.unitedStatesEnglish: 'Gender',
    LanguageType.indonesiaIndonesian: 'Jenis kelamin',
  },
  'Man': {
    LanguageType.unitedStatesEnglish: 'Man',
    LanguageType.indonesiaIndonesian: 'Laki-laki',
  },
  'Woman': {
    LanguageType.unitedStatesEnglish: 'Woman',
    LanguageType.indonesiaIndonesian: 'Perempuan',
  },
  'Sign in': {
    LanguageType.unitedStatesEnglish: 'Sign in',
    LanguageType.indonesiaIndonesian: 'Masuk',
  },
  'Sign up': {
    LanguageType.unitedStatesEnglish: 'Sign up',
    LanguageType.indonesiaIndonesian: 'Daftar',
  },
  'Don\'t have an account yet?': {
    LanguageType.unitedStatesEnglish: 'Don\'t have an account yet?',
    LanguageType.indonesiaIndonesian: 'Belum punya akun?',
  },
  'Username or password is still empty': {
    LanguageType.unitedStatesEnglish: 'Username or password is still empty',
    LanguageType.indonesiaIndonesian: 'Username atau kata sandi masih kosong',
  },
  'Account created successfully': {
    LanguageType.unitedStatesEnglish: 'Account created successfully',
    LanguageType.indonesiaIndonesian: 'Akun berhasil dibuat',
  },
  'Account failed to create': {
    LanguageType.unitedStatesEnglish: 'Account failed to create',
    LanguageType.indonesiaIndonesian: 'Akun gagal dibuat',
  },
  'User is not found': {
    LanguageType.unitedStatesEnglish: 'User is not found',
    LanguageType.indonesiaIndonesian: 'Pengguna tidak ditemukan',
  },
  'Home': {
    LanguageType.unitedStatesEnglish: 'Home',
    LanguageType.indonesiaIndonesian: 'Beranda',
  },
  'Eat': {
    LanguageType.unitedStatesEnglish: 'Eat',
    LanguageType.indonesiaIndonesian: 'Makan',
  },
  'Exercise': {
    LanguageType.unitedStatesEnglish: 'Exercise',
    LanguageType.indonesiaIndonesian: 'Olahraga',
  },
  'Settings': {
    LanguageType.unitedStatesEnglish: 'Settings',
    LanguageType.indonesiaIndonesian: 'Pengaturan',
  },
  'History': {
    LanguageType.unitedStatesEnglish: 'History',
    LanguageType.indonesiaIndonesian: 'Riwayat',
  },
  'Activity': {
    LanguageType.unitedStatesEnglish: 'Activity',
    LanguageType.indonesiaIndonesian: 'Aktivitas',
  },
  'Add activity': {
    LanguageType.unitedStatesEnglish: 'Add activity',
    LanguageType.indonesiaIndonesian: 'Tambah aktivitas',
  },
  'Food name': {
    LanguageType.unitedStatesEnglish: 'Food name',
    LanguageType.indonesiaIndonesian: 'Nama makanan',
  },
  'Calory': {
    LanguageType.unitedStatesEnglish: 'Calory',
    LanguageType.indonesiaIndonesian: 'Kalori',
  },
  'kcal': {
    LanguageType.unitedStatesEnglish: 'kcal',
    LanguageType.indonesiaIndonesian: 'kkal',
  },
  'Kg': {
    LanguageType.unitedStatesEnglish: 'Kg',
    LanguageType.indonesiaIndonesian: 'Kg',
  },
  'Minute': {
    LanguageType.unitedStatesEnglish: 'Minute',
    LanguageType.indonesiaIndonesian: 'Menit',
  },
  'Weight': {
    LanguageType.unitedStatesEnglish: 'Weight',
    LanguageType.indonesiaIndonesian: 'Berat badan',
  },
  'Exercise time': {
    LanguageType.unitedStatesEnglish: 'Exercise time',
    LanguageType.indonesiaIndonesian: 'Waktu olahraga',
  },
  'Add': {
    LanguageType.unitedStatesEnglish: 'Add',
    LanguageType.indonesiaIndonesian: 'Tambah',
  },
  'General sports': {
    LanguageType.unitedStatesEnglish: 'General sports',
    LanguageType.indonesiaIndonesian: 'Olahraga umum',
  },
  'Individual exercise': {
    LanguageType.unitedStatesEnglish: 'Individual exercise',
    LanguageType.indonesiaIndonesian: 'Olahraga diri sendiri',
  },
  '(Badminton, Football, Basketball, Yoga, Cycling, Gymnastics, Pilates, Tai chi)': {
    LanguageType.unitedStatesEnglish: '(Badminton, Football, Basketball, Yoga, Cycling, Gymnastics, Pilates, Tai chi)',
    LanguageType.indonesiaIndonesian: '(Bulu Tangkis, Sepak Bola, Basket, Yoga, Bersepeda, Senam, Pilates, Tai chi)',
  },
  '(Walking, Jumping Jacks, Push Ups, Leg Lifts, Sit Ups, Jogging, Squats, Lifting Weights)': {
    LanguageType.unitedStatesEnglish: '(Walking, Jumping Jacks, Push Ups, Leg Lifts, Sit Ups, Jogging, Squats, Lifting Weights)',
    LanguageType.indonesiaIndonesian: '(Jalan-Jalan, Jumping Jack, Push Up, Leg Lift, Sit Up, Jogging, Squat, Angkat Beban)',
  },
  'Food name or calory is still empty': {
    LanguageType.unitedStatesEnglish: 'Food name or calory is still empty',
    LanguageType.indonesiaIndonesian: 'Nama makanan atau kalori masih kosong',
  },
  'Weight or exercise time is still empty': {
    LanguageType.unitedStatesEnglish: 'Weight or exercise time is still empty',
    LanguageType.indonesiaIndonesian: 'Berat badan atau waktu olahraga masih kosong',
  },
  'Activity added successfully': {
    LanguageType.unitedStatesEnglish: 'Activity added successfully',
    LanguageType.indonesiaIndonesian: 'Aktivitas berhasil ditambahkan',
  },
  'Activity failed to add': {
    LanguageType.unitedStatesEnglish: 'Activity failed to add',
    LanguageType.indonesiaIndonesian: 'Aktivitas gagal ditambahkan',
  },
  'The number of calories entered today': {
    LanguageType.unitedStatesEnglish: 'The number of calories entered today',
    LanguageType.indonesiaIndonesian: 'Jumlah kalori masuk hari ini',
  },
  'The number of calories out today': {
    LanguageType.unitedStatesEnglish: 'The number of calories out today',
    LanguageType.indonesiaIndonesian: 'Jumlah kalori keluar hari ini',
  },
  'Remaining calories for the day': {
    LanguageType.unitedStatesEnglish: 'Remaining calories for the day',
    LanguageType.indonesiaIndonesian: 'Sisa kalori hari ini',
  },
  'Notes': {
    LanguageType.unitedStatesEnglish: 'Notes',
    LanguageType.indonesiaIndonesian: 'Catatan',
  },
  'Today you have excess calories, please exercise': {
    LanguageType.unitedStatesEnglish: 'Today you have excess calories, please exercise',
    LanguageType.indonesiaIndonesian: 'Hari ini Anda kelebihan kalori, silahkan olahraga',
  },
  'Today you are low on calories, please eat': {
    LanguageType.unitedStatesEnglish: 'Today you are low on calories, please eat',
    LanguageType.indonesiaIndonesian: 'Hari ini Anda kekurangan kalori, silahkan makan',
  },
  '{0} kcal': {
    LanguageType.unitedStatesEnglish: '{0} kcal',
    LanguageType.indonesiaIndonesian: '{0} kkal',
  },
  '{0} Kg': {
    LanguageType.unitedStatesEnglish: '{0} Kg',
    LanguageType.indonesiaIndonesian: '{0} Kg',
  },
  '{0} Minute': {
    LanguageType.unitedStatesEnglish: '{0} Minute',
    LanguageType.indonesiaIndonesian: '{0} Menit',
  },
  'Date': {
    LanguageType.unitedStatesEnglish: 'Date',
    LanguageType.indonesiaIndonesian: 'Tanggal',
  },
  'Summary': {
    LanguageType.unitedStatesEnglish: 'Summary',
    LanguageType.indonesiaIndonesian: 'Ringkasan',
  },
  'Total food': {
    LanguageType.unitedStatesEnglish: 'Total food',
    LanguageType.indonesiaIndonesian: 'Total makanan',
  },
  'Total calories': {
    LanguageType.unitedStatesEnglish: 'Total calories',
    LanguageType.indonesiaIndonesian: 'Total kalori',
  },
  'Total exercise': {
    LanguageType.unitedStatesEnglish: 'Total exercise',
    LanguageType.indonesiaIndonesian: 'Total olahraga',
  },
  'Total minute': {
    LanguageType.unitedStatesEnglish: 'Total minute',
    LanguageType.indonesiaIndonesian: 'Total menit',
  },
  'Total calories burned': {
    LanguageType.unitedStatesEnglish: 'Total calories burned',
    LanguageType.indonesiaIndonesian: 'Total kalori terbakar',
  },
  'Logout': {
    LanguageType.unitedStatesEnglish: 'Logout',
    LanguageType.indonesiaIndonesian: 'Keluar',
  },
  'Profile': {
    LanguageType.unitedStatesEnglish: 'Profile',
    LanguageType.indonesiaIndonesian: 'Profil',
  },
  'Profile saved successfully': {
    LanguageType.unitedStatesEnglish: 'Profile saved successfully',
    LanguageType.indonesiaIndonesian: 'Profil berhasil disimpan',
  },
  'Profile failed to save': {
    LanguageType.unitedStatesEnglish: 'Profile failed to save',
    LanguageType.indonesiaIndonesian: 'Profil gagal disimpan',
  },
  'Detail eat': {
    LanguageType.unitedStatesEnglish: 'Detail eat',
    LanguageType.indonesiaIndonesian: 'Detail makan',
  },
  'Detail exercise': {
    LanguageType.unitedStatesEnglish: 'Detail exercise',
    LanguageType.indonesiaIndonesian: 'Detail olahraga',
  },
  'Exercise type': {
    LanguageType.unitedStatesEnglish: 'Exercise type',
    LanguageType.indonesiaIndonesian: 'Tipe olahraga',
  },
  'Calories burned': {
    LanguageType.unitedStatesEnglish: 'Calories burned',
    LanguageType.indonesiaIndonesian: 'Kalori terbakar',
  },
};

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations shared;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
	  'welcome' : "Welcome back!",
    'The easiest way to keep your customers happy while waiting.':'The easiest way to keep your customers happy while waiting.',
    'or sign in using':'or sign in using',
    'Create account':'Create acccount',
	  'about_title': "About us",
	  'about_tab_about': "About us",
	  'about_tab_background': "Background",
	  'about_tab_sources': "Sources",
	  'about_about_title':'Welcome to the infidelity ER',
	  'about_about_text': 'This application is designed for couples and individuals who in one way or the other have experienced infidelity.\n\nThe purpose of the app is to create a clear view of how we are affected by infidelity, but also what to expect from a partner and what we need to take responsibility for ourselves.\n\nThe Infidelity ER app covers all phases; from the first suspicion of infidelity to finding your way back to a safe place, together or separately.',
	  'about_about_text_2': 'The app is what the name implies: An infidelity ER. The need for information and guidance is huge and essential – at the beginning. When the couple (together or individually) have a map to navigate by, it’s easier to move forward and reach the destination. It takes time and a lot of work, which the couple is responsible for, and they do so by being patient, open, honest and courageous. There is no room for lies, denial, accusations or defensiveness in that process.\n\nIn order to be constructive even when you feel all messed up, you need to understand that all your feelings are natural and allow yourself to feel them. Therefore, the content of the app is non-judging and aims to be neutral and understanding for both parties. For that reason, many of the phases are described from both perspectives. Whatever the reason for the behaviour, personal responsibility is crucial for the outcome. To be able to move on you need to practice will-power, acceptance and empathy.',
	  'about_background_title':'Background to the application Infidelity ER',
	  'about_background_text': 'The Infidelity ER is an app created to help couples and individuals create awareness about infidelity. It offers different tools to understand oneself, all the feelings and different behaviours when we suspect infidelity and also when it is a fact.\n\nThe purpose of the app is to reach more people and couples that need support and guidance. It is based on the thorough work of a couples therapist, which led her to blog about infidelity, which then resulted in a lot of followers and questions from people eager to know more. Couples from all over Sweden scheduled appointments to get help, so there’s obviously a great need for guidance to repair a relationship and heal.\n\nThe Infidelity ER app gives hands-on help and advice to couples and individuals. It guides you through the mess and leads to a greater awareness about what’s going on, both in the relationship and within yourself, when you find yourself in the emotional chaos that follows infidelity.',
	  'about_background_text_2':'The process of the app is the same as for couples who turn to the couple therapist’s office, and therefore they are well tried. There are so many examples of couples that heal, develop and find the way back to each other, stronger and more secure than they were before. There are also examples of couples that break up, but only after taking the chance to work their way through what has happened, and reconcile. This app will guide you step by step to succeed.\n\nThe main responsibility lies with those who follow the process, partially by trying to understand their partner, and also by being brave enough to go through the different steps. The purpose is to move from power struggle to teamwork, and to free yourself from the pain caused by being let down or betrayed.',
	  'about_background_siganture_name':'Anneli Östling, Relationsexpert',
      /*Not translated*/ 'about_sources_title': 'Litteratur',
	  /*Not translated*/ 'about_sources_text': 'Assagioli, Roberto: Om Viljan, Mareld Böcker (2003) ISBN 9188872475\n\nAssagioli, Roberto: Psykosyntes – grundläggande principer och tekniker, Mareld Böcker (2006) ISBN 9188872750\n\nBrown, Brené: Daring Greatly: How the courage to be vulnerable transforms the way we live, love parent and lead, Penguin Life Books (2012) ISBN 978-0-241-25740-1\n\nDahl, Laila: Det är en sak jag måste berätta, Libris (2015) ISBN: 978-91-7387-478-6\n\nDeida, David: Finn din Gudomliga källa genom sex, Energica förlag AB (2002) ISBN 91-87056-87-9\n\nDimberly, Richard, Burton, Graeme: Kommunikation är mer än ord, Studentlitteratur (1999) ISBN 91-44-00907-0\n\nFerrucci, Piero: Bli den du är, Liber Ekonomi (2001) ISBN 91-47-06021-2\n\nGerhardt, Sue: Kärlekens roll: Hur känslomässig närhet formar spädbarnets hjärna, Karneval Förlag (2015) ISBN 978-91-87207-49-5\n\nGottman, John Mordechai, Principia Amoris: The new science of love, Routledge (2015) ISBN 978-0-415-64155-5\n\nHansen, Anders: Hjärnstark: Hur motion och träning starker din hjärna, Fakta Månpocket (2016) ISBN 978-91-7503-845-2\n\nHendrix, Harville: I stället för skilsmässa, Natur&Kultur (2009) ISBN 978-91-27-11975-8\n\nHendrix, Harville: Tag vara på de kärlek du finner, Lind & Co (2010) ISBN 978-91-85801-83-1\n\nJohnson, Susan M: Håll om mig: Sju livsavgörande samtal om kärlek, OrdGlob Förlag (2012) ISBN 978-91-980080-0-5\n\nJohnson, Susan M: The practice of Emotionally Focused Couple Therapy: Creating connection, Brunner-Routhledge (2004) ISBN 0-415-94568-2\n\nJosefsson, Dan, Linge, Egil: Hemligheten: Från ögonkast till varaktig relation, Natur&Kultur (2008) ISBN 978-91-27-11521-7\n\nKahn, Michael: Between Therapist and Client: The new relationship, Holt Paperbacks (1996) ISBN 978-0-8050-7100-9\n\nMellody, Pia: Facing Codependence, Harper Collins Publishers (1989) ISBN 978-0-06-250589-7\n\nPerel, Esther: Kärlekskris: Gå vidare efter otrohet, Brombergs Bokförlag AB och Linda Skugge (2018) ISBN 978-91-7337-993-9\n\nPerel, Esther: Mating in captivity: sex, lies and domestic bliss, Hodder & Stoughton (2007) ISBN 978-0340-943755\n\nRydberg, Kerstin, Sundby, Erik: Det är inte kärlek – När sex blir en drog, Norstedts (2012) ISBN 978-91-1-303735-6\n\nSiegel, Daniel J: Mindsight: The new science of personal transformation, Bantam Books (2010) ISBN 978-0-553-80470-6\n\nSiegel, Daniel J: Pocket Guide to Interpersonal Neurobiology, W.W. Norton & Co inc. (2012) ISBN 978-0-393-70713-7\n\nSinkjaer Simon, Jette: Imago: kärlekens terapi, Vattumannen Förlag (2007) ISBN 978-91-87512-56-8\n\nTolle, Eckhart: Lev livet fullt ut, Massolit Förlag (1997) ISBN 978-91-87505-54-6\n\nWeill, Andrew: Spontaneous Happiness, Little Brown and Company (2011) ISBN 978-0-316-12944-2\n\nWettergren, Åsa: Emotionssociologi, Gleerups Utbildning AB (2013) ISBN 978-91-40-67653-5\n\nWährborg, Peter: Stress: och den nya ohälsan, Natur&Kultur (2009) ISBN 978-91-27-11656-6\n\nYoung, Jeffrey E: Lev som du vill och inte som du lärt dig, Natur&Kultur (1993) ISBN 978-91-27-12109-6',

      'app_name': 'ROA EN',
      'locale_str': 'en',

	  'audio_text':'Listen to the text?',

      'something_went_wrong': 'Something went wrong',
      'cancel': 'Cancel',
      'please_fill_all_data': 'Please fill all data.',
      'user_already_exist': 'User already exist.',
      'verificaiton_email_sent': 'We have sent a verification email to the address you provided.',
	  'account_created_message': 'Account created successfully, Please login.',

      /*Not translated*/ 'generic_save': 'Save',
      /*Not translated*/ 'generic_send': 'Send',
      /*Not translated*/ 'generic_ok': 'OK',

	  'chat_closed_message': 'The chat is now closed for today and you cannot send any more messages to us. We will do our utmost to respond to your latest message as soon as we can.',

	  'home_about': 'About the Infidelity ER',
	  /*Not translated*/ 'home_suspect': 'Suspecting infidelity',
      /*Not translated*/ 'home_cheating': 'Discovering infidelity',
      'home_navbar_title': 'Start page',
      /*Not translated*/ 'home_repair': 'Repairing the relationship',
      /*Not translated*/ 'home_secure': 'Securing & Preventing',
      /*Not translated*/ 'home_take_care': 'Taking care of myself',
	  /*Not translated*/ 'home_chat': 'Chat',
	  'home_faq': 'Questions & Answers',

	  'intro_cheated_title': 'I’ve let my partner down',
      'intro_cheated_text': 'Welcome to the Infidelity ER,\n\nI will guide and support you through this tough situation where you might feel bad, immobilized, sad or emotionally confused. You have let your partner down and don’t know how to regain his/her trust. Even if the damage is already done, there’s still a lot you can do to help and take responsibility for the pain you’ve caused.\n\nI guess that you’ve been disappointed with the relationship, perhaps not appreciated or seen by your partner, and we’ll get back to that later on in the process. I also assume that you wish you had taken a greater responsibility for the relationship by communicating your dissatisfaction earlier, or perhaps ended the relationship before being physically or emotionally unfaithful. Keep in mind that infidelity is a common and human behaviour, and there are ways to be forgiven and repair the damage if you want to.\n\nYou will be guided through the process in a non-judgemental way, so that you both get the chance to move forward. You will learn to understand what happens with you in different phases, so that you can stand up for your needs at the same time as you support your partner. He/she will need you and your care more than ever.\n\nIn the beginning you will have to take responsibility for the pain you have caused your partner. Later on in the process we look further into the relationship and what has been lacking in it.\n\nWelcome to the Infidelity ER!',
      'intro_continue': 'Start now',
	  'intro_let_down_title': 'I’ve been betrayed',
      'intro_let_down_text': 'Welcome to the Infidelity ER,\n\nThis is like a “first aid-kit” with support and guidance when you find yourself in the shaky situation of being let down by your partner.\n\nTo be betrayed by the person closest to you, can be a shock and completely devastating. But it is not uncommon and there is help available. To repair a relationship after infidelity is a systematical process, and wherever it leads you, you have everything to gain from trying to make things right and taking responsibility for the situation.\n\nIn the beginning you have to feel assured that it is your right to be respected and treated with care, regardless of your emotional chaos. Later on you will also have to take a look at your own contribution to the situation. You will be guided through the process in a non-judgemental way, so that you both get a chance to move forward. You will learn to understand what happens with you in different phases, so that you can stand up for your needs at the same time as you dare to show your vulnerability.\n\nWelcome to the Infidelity ER!',
      'intro_navbar_title': 'Welcome',
	  'intro_prevent_title': 'I want to prevent crisis and infidelity',
      'intro_prevent_text': 'Welcome to the Infidelity ER,\n\nIn this app I give you the guidance you need to create security and joy in the relationship. To do this “safety check-up” is preventive work that you can start doing early in the relationship, or later. The purpose is to avoid crisis or behavioural patterns that can lead to infidelity.\n\nImbalance can lead to great harm, so it’s important to take responsibility early on. The fear of being perceived as a demanding partner can make you hesitate, but you have everything to gain from building an awareness and seeking knowledge about how to care for your relationship. To have expectations and dare to make demands is a how you stay an engaged partner. You will learn to use empathetic communication, which is based on mutual respect and care.\n\nI will guide you through the process in a non-judgemental way, so that you both can develop a greater knowledge of how to create security, trust and joy in your relationship.\n\nWelcome to the Infidelity ER!',
      'intro_skip': "Skip",
	  'intro_responsibility_title': 'I want to take responsibility for the person I wish to be in a relationship',
      'intro_responsibility_text': 'Welcome to the Infidelity ER,\n\nI guess you found your way here since you are curious about how you can create and maintain good relationships, both with yourself and others. We can all strive to be our best selves, which will improve our well-being and quality of life. A lot of it is based on how we function when we interact with others, and taking responsibility for our own contribution in relationships.\n\nIn this app you will find guidance and support within different areas, which will improve your ability to take responsibility for and express your needs and wishes. It will give you knowledge and an awareness that you will benefit from throughout your life. A lot of us tend to care more about satisfying other peoples’ wishes, before listening to ourselves and taking responsibility for our own needs. Learning to stand up for yourself is the best way to feel alive, strong and to stay genuine in encounters with other people. It makes you interesting, clear and easy to be with.\n\nNo process of growth is easy, but I hope that the positive changes you experience will encourage you to keep going with the work.\n\nWelcome to the Infidelity ER, and best of luck with your personal growth!',
	  'intro_suspect_title': 'I suspect infidelity',
      'intro_suspect_text': 'Welcome to the Infidelity ER,\n\nThis app will guide you from a situation that can be both fearsome and anxious. You suspect that your partner is cheating on you, or giving too much attention to someone else.\n\nListen to your gut feeling; it is rarely wrong. But if you’ve been let down before, the emotional wounds can make you extra sensitive and suspicious. Always searching for signs of betrayal will hurt any relationship, so it’s important to reflect over the different signals and try to find a constructive approach. Your fear can cause a lot of trouble, so you might need help to work around it in order to get a clear view over the situation. Hopefully your partner can be supportive in that process.\n\nInfidelity is common and sometimes two partners can have different definitions of what infidelity is. You need to find out – and be clear about – where you draw the line. The Infidelity ER application will support and guide you in the process of taking responsibility for both yourself and the relationship.\n\nWelcome to the Infidelity ER!',
      'intro_title': 'Welcome to the\nInfidelity ER',
	  'intro_desc': 'The app guides you in being confident in the relationship with yourself and your partner. Start by clicking on the symbol that fits you.',

      'chat_introduction_closed': 'Chat is closed',
      'chat_introduction_info': 'Here you, as a subscriber to the app, can ask questions that you wish to receive answers to, related to the areas in which the app guides. All questions are treated with respect and read under confidentiality. The chat is open Thursdays between 13: 00-15: 00 (time zone Stockholm, Sweden). In exceptional cases, the chat time can be changed to another day or time. The next opening time is always displayed on the red button on this page.\n\nTip:\nAsk one question at a time and try to be concise and clear to allow a quick constructive answer. Each user can ask no more than two questions at each chat session. At high loads, responses can be delayed. The questions are answered in turn and we do our utmost to respond to your latest message as soon as we can. When the chat closes, you can no longer send us more messages. The ambition is to answer all the questions that are asked at every opportunity.',
      'chat_introduction_navbar_title': 'Chat',
      'chat_navbar_title': 'Chat',
      'chat_introduction_open': 'Chat is open',
      'chat_introduction_start': 'Start chatting',
	  /** Not Translated */ 'chat_introduction_start_on': 'Start on',
      'chat_introduction_title': 'Welcome to Chat!',
      'chat_enter_text': 'Enter text here',

	  'chat_page_delete':'Delete',
	  'chat_page_resend':'Resend',

      'login_create_account': 'No account? Create one here',
      'login_email_hint': "Email",
      /** Not Translated */ 'login_email_password_incorrect': "Email or password is incorrect.",
      /** Not Translated */ 'login_email_not_verified': "Email address is not verified. do you want us to resend the verification email?",
      /** Not Translated */ 'login_resend_email_verification': "Resend verification email",
      /** Not Translated */ 'login_user_not_exist': "User does not exist.",
      'login_forgot_password': 'Forgot password?',
      'login_forgot_password_info': 'Please write the email adress you used when creating the account below',
      'login_forgot_password_reset': 'Reset password',
      'login_forgot_password_success': 'An email with instructions have been sent to the address you specified',
      'login_forgot_password_title': 'Forgot password',
      'login_incorrect_email': 'Not a valid email address',
      'login_login': 'Login',
      'login_password_hint': 'Password',
      'login_username_hint': 'Username',

      'overview_navbar_title': 'Overview',
      'overview_previous_chapters_first': 'You need to finish all previous chapters before you can continue',

      'register_accept_terms_conditions': 'Approve Terms & Conditions',
      'register_accept_terms_conditions_required': 'You need to approve Terms & Conditions',
      'register_create_account': 'Create account',
      'register_email_hint': 'Email',
      'register_incorrect_email': 'Not a valid email address',
      'register_password_hint': 'Password',
      'register_password_mismatch': 'Passwords do not match',
      'register_password_missing': 'Choose a password',
      'register_password_repeat_hint': 'Repeat password',
	  'register_failed_to_create_account': 'Failed to create account',
	  'register_username_hint': 'Username (Only shown for admin in chat)',
	  'register_username_empty_message': 'Please enter username',

      'settings_delete_user': 'Delete account',
      'settings_delete_user_alert_title': 'Are you sure?',
      'settings_email': 'Email',
      'settings_logout': 'Logout',
      /** Not Translated */ 'settings_logout_alert_title': 'Are you sure?',
      'settings_navbar_title': 'Settings',
      'settings_password': 'Password',
      'settings_subscription': 'Subscription',
      'settings_subscription_none': 'None',
	  "settings_faq": "Frequently asked questions",
	  'settings_terms_and_conditions': 'Terms & Conditions',
	  'settings_username': 'Username',
	  'settings_username_change_title': 'Change username (Only shown for admin in chat)',
	  'settings_update': 'Update',
	  'settings_password_change_title': 'Change password',

	  'subscription_navbar_title': 'ER Infidelity subscription',
	  'subscription_subscribe': 'Subscribe',
	  'subscription_restore': 'Restore subscribe',
	  'subscription_product_not_founds': 'Products not found.',
	  'subscription_purchase_not_found': 'No purchase found.',
	  'subscription_item_already_owned': 'Seems like you already purchased this item, please restore purchase.',
	  'subscription_item_unavailable': 'Item unavailable',
	  'subscription_message': 'You need to purchase a one month automatic renewal subscription to access all the features of the app. When you start your subscription you will get access to all chapters and chat with a professional adviser. You have access to the complete app during the subscription time',
	  'subscription_note_title':'NOTE:',
	  'subscription_note1': '- Payment is charged with SEK 99 for a month subscription, after which the subscription is renewed monthly for SEK 99 per month.',
      'subscription_note2': '- Payment is debited to your iTunes account upon confirmation of purchase.',
	  'subscription_note2_android': '- Payment is debited to your Android account upon confirmation of purchase.',
      'subscription_note3': '- The account is charged for renewal within 24 hours before the end of the current period.',
	  'subscription_note4': '- Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period.',
      'subscription_note5': '- Subscriptions can be managed by the user and automatic renewal can be turned off by going to the user\'s account settings after purchase.',

	  'subscription_terms_message':'By complete the purchase you accept our terms.',
	  'subscription_terms_part1':'Read our ',
	  'subscription_terms_part2':'Terms & Conditions and Privacy Policy',

	  "faqs_navbar_title": "FAQs",

	  "splash_logo":'images/logo_animated_en.gif',

	  'login_skip': "Skip login",
	  'login_required_message': "To proceed in the app you need to login with an account. Creating an account is free. If you later want to access our premium material such as chat and all chapters containing guidance, advice and relationship tools, there is a cost.",
    'failed_register_notification':"Failed to register notification"
    },
    'sv': {
	  'about_title': "Om oss",
	  'about_tab_about': "Om oss",
	  'about_tab_background': "Bakgrund",
	  'about_tab_sources': "Källor",
	  'about_about_title':'Beskrivning av appen Otrohetsakuten',
	  'about_about_text': 'Hej och välkommen till Otrohetsakuten!\n\nDen här applikationen är till för par och enskilda individer som på olika sätt har erfarenhet av otrohet.\n\nSyftet är att skapa en klarare bild av hur man påverkas av otrohet. Men också vad man kan förvänta sig av sin partner och vad man själv behöver ta ansvar för.',
	  'about_about_text_2': 'Applikationen täcker in alla faser: från misstanke om otrohet till att hitta tillbaka till en trygg plats – tillsammans eller var för sig.\n\nApplikationen är vad namnet utlovar: en otrohetsakut. Detta för att behovet av information och guidning är som störst – och mest bråttom – i en tidig fas. När paret – eller de enskilda individerna –har en karta att navigera efter är det lättare att nå målet. Men det långsiktiga arbetet behöver paret självt ta ansvar för, vilket förutsätter tålamod, öppenhet, ärlighet och mod. På den vägen finns inget utrymme för lögner, förnekelse, anklagelser eller försvar.\n\nFör att vara konstruktiv – fast man känner sig illa tilltygad – behöver man först förstå att alla känslor är normala och ge sig tillåtelse att känna dem. Applikationens innehåll är därför icke-dömande och syftar till att visa förståelse för båda parter. Det betyder också att alla faser som paret/individen tar sig igenom beskrivs från bådas perspektiv. Oavsett orsaker till beteendet är det personliga ansvaret avgörande för utgången. För att lyckas komma vidare behövs även vilja, ödmjukhet och empati.',
	  'about_background_title':'Bakgrund till appen Otrohetsakuten',
	  'about_background_text': 'Otrohetsakuten är en applikation som tagits fram för att hjälpa par och enskilda individer att skapa medvetenhet kring otrohet. Den erbjuder redskap att förstå sig själv, sina känslor och sitt agerande – både när man misstänker otrohet och när otroheten är ett faktum.\n\nSyftet med appen är att nå ut till fler som behöver stöd och vägledning. Bakgrunden till den är dels en erfaren parterapeuts gedigna arbete på sin mottagning, dels bloggtexter om otrohet som gjort att många läsare hört av sig med önskan om att veta mer. Par bokade tider och kom resande från hela Sverige. Det fanns ett stort behov av att få hjälp att reparera och läka.\n\nAppen ger konkret hjälp till par och enskilda individer. Den syftar till att skapa medvetenhet om vad som händer, både i relationen och inom en själv, när man drabbas.',
	  'about_background_text_2':'Det processarbete som appen vägleder i är detsamma som för de par som kommer till parterapeutens mottagning och är därför noga beprövade. Det finns fler exempel på hur par läker, utvecklas och hittar tillbaka till varandra, tryggare än vad de var innan. Det finns förstås också exempel på par som har brutit upp men som fått möjlighet att bearbeta det som hänt och försonas. Appen avslöjar vad som krävs för att lyckas.\n\nDet ligger ett stort ansvar hos den som följer programmet, dels att hitta viljan att försöka förstå den andra parten, dels att vara modig och ta de olika stegen. Syftet är att gå från maktkamp till samspel. Och bli fri från smärtan av att ha blivit sviken eller själv ha svikit.',
	  'about_background_siganture_name':'Anneli Östling, Relationsexpert',
	  'about_sources_title': 'Litteratur',
      'about_sources_text': 'Assagioli, Roberto: Om Viljan, Mareld Böcker (2003) ISBN 9188872475\n\nAssagioli, Roberto: Psykosyntes – grundläggande principer och tekniker, Mareld Böcker (2006) ISBN 9188872750\n\nBrown, Brené: Daring Greatly: How the courage to be vulnerable transforms the way we live, love parent and lead, Penguin Life Books (2012) ISBN 978-0-241-25740-1\n\nDahl, Laila: Det är en sak jag måste berätta, Libris (2015) ISBN: 978-91-7387-478-6\n\nDeida, David: Finn din Gudomliga källa genom sex, Energica förlag AB (2002) ISBN 91-87056-87-9\n\nDimberly, Richard, Burton, Graeme: Kommunikation är mer än ord, Studentlitteratur (1999) ISBN 91-44-00907-0\n\nFerrucci, Piero: Bli den du är, Liber Ekonomi (2001) ISBN 91-47-06021-2\n\nGerhardt, Sue: Kärlekens roll: Hur känslomässig närhet formar spädbarnets hjärna, Karneval Förlag (2015) ISBN 978-91-87207-49-5\n\nGottman, John Mordechai, Principia Amoris: The new science of love, Routledge (2015) ISBN 978-0-415-64155-5\n\nHansen, Anders: Hjärnstark: Hur motion och träning starker din hjärna, Fakta Månpocket (2016) ISBN 978-91-7503-845-2\n\nHendrix, Harville: I stället för skilsmässa, Natur&Kultur (2009) ISBN 978-91-27-11975-8\n\nHendrix, Harville: Tag vara på de kärlek du finner, Lind & Co (2010) ISBN 978-91-85801-83-1\n\nJohnson, Susan M: Håll om mig: Sju livsavgörande samtal om kärlek, OrdGlob Förlag (2012) ISBN 978-91-980080-0-5\n\nJohnson, Susan M: The practice of Emotionally Focused Couple Therapy: Creating connection, Brunner-Routhledge (2004) ISBN 0-415-94568-2\n\nJosefsson, Dan, Linge, Egil: Hemligheten: Från ögonkast till varaktig relation, Natur&Kultur (2008) ISBN 978-91-27-11521-7\n\nKahn, Michael: Between Therapist and Client: The new relationship, Holt Paperbacks (1996) ISBN 978-0-8050-7100-9\n\nMellody, Pia: Facing Codependence, Harper Collins Publishers (1989) ISBN 978-0-06-250589-7\n\nPerel, Esther: Kärlekskris: Gå vidare efter otrohet, Brombergs Bokförlag AB och Linda Skugge (2018) ISBN 978-91-7337-993-9\n\nPerel, Esther: Mating in captivity: sex, lies and domestic bliss, Hodder & Stoughton (2007) ISBN 978-0340-943755\n\nRydberg, Kerstin, Sundby, Erik: Det är inte kärlek – När sex blir en drog, Norstedts (2012) ISBN 978-91-1-303735-6\n\nSiegel, Daniel J: Mindsight: The new science of personal transformation, Bantam Books (2010) ISBN 978-0-553-80470-6\n\nSiegel, Daniel J: Pocket Guide to Interpersonal Neurobiology, W.W. Norton & Co inc. (2012) ISBN 978-0-393-70713-7\n\nSinkjaer Simon, Jette: Imago: kärlekens terapi, Vattumannen Förlag (2007) ISBN 978-91-87512-56-8\n\nTolle, Eckhart: Lev livet fullt ut, Massolit Förlag (1997) ISBN 978-91-87505-54-6\n\nWeill, Andrew: Spontaneous Happiness, Little Brown and Company (2011) ISBN 978-0-316-12944-2\n\nWettergren, Åsa: Emotionssociologi, Gleerups Utbildning AB (2013) ISBN 978-91-40-67653-5\n\nWährborg, Peter: Stress: och den nya ohälsan, Natur&Kultur (2009) ISBN 978-91-27-11656-6\n\nYoung, Jeffrey E: Lev som du vill och inte som du lärt dig, Natur&Kultur (1993) ISBN 978-91-27-12109-6',

      'app_name': 'ROA SE',
      'locale_str': 'se',

	  'audio_text':'Lyssna på texten?',

      'something_went_wrong': 'Någonting gick fel',
      'cancel': 'Avbryt',
      'please_fill_all_data': 'Vänligen fyll I alla fält',
      'user_already_exist': 'Användaren finns redan.',
      'verificaiton_email_sent': 'Vi har skickat ett verifikationsmail till den epost du angav.',
	  'account_created_message': 'Ditt konto är nu skapat och du kan nu logga in.',

      'generic_save': 'Spara',
      'generic_send': 'Gå vidare',
      'generic_ok': 'OK',

	  'chat_closed_message': 'Chatten är nu stängd för idag och du kan inte skicka fler meddelanden till oss. Vi gör vårt yttersta för att besvara ditt senaste meddelande så snart vi kan.',

	  'home_about': 'Om Otrohetsakuten',
	  'home_suspect': 'Misstanke om Otrohet',
      'home_cheating': 'Uppdagad Otrohet',
      'home_navbar_title': "Startsida",
      'home_repair': 'Reparera Otrohet',
      'home_secure': 'Trygghetssäkra och förebygg',
      'home_take_care': 'Mitt eget ansvar i en relation',
	  'home_chat': 'Chatt',
	  'home_faq': 'Frågor & Svar',

	  'intro_cheated_title': 'Jag har svikit min partner',
      'intro_cheated_text': 'Hej och varmt välkommen till Otrohetsakuten!\n\nJag ska ge dig stöd och guidning i en svår situation där du kanske känner dig dålig, ledsen, maktlös eller känslomässigt förvirrad. Du har svikit din partner och vet inte hur du ska agera för att återfå hens förtroende. Även om skadan är skedd finns en hel del som du kan göra för att ta ansvar för den smärta du orsakat.\n\nJag gissar att du varit besviken i relationen, att du inte känt dig sedd och bekräftad av din partner – det kommer vi att ta hand om längre fram i det här arbetet. Jag förmodar också att du önskade att du tidigare tagit större ansvar för din relation genom att kommunicera ditt missnöje. Eller att du avslutat relationen innan du valde att vara fysiskt/emotionellt otrogen. Otrohet är dock ett mänskligt beteende och det går att be om förlåtelse och reparera skadan om du vill.\n\nJag guidar dig/er genom processen på ett icke-dömande sätt så att ni båda kan röra er framåt. Du kommer att få förståelse för vad som händer med dig/er i olika skeden för att kunna stå upp för dina behov och samtidigt vara till hjälp för din partner. Hen kommer att behöva dig och din omsorg mer än någonsin.\n\nInledningsvis kommer du att behöva ta ansvar för den smärta du orsakat. Därefter tittar vi på hela relationen och vad den lidit brist på.\n\nVarmt välkommen till Otrohetsakuten!',
      'intro_continue': 'Börja nu',
	  'intro_let_down_title': 'Jag har blivit sviken',
      'intro_let_down_text': 'Hej och varmt välkommen till Otrohetsakuten!\n\nJag ska ge dig akut stöd och guidning om du befinner dig på en otrygg plats där du blivit sviken och sårad av din partner.\n\nAtt bli sviken av den person som står en närmast kan upplevas fasansfullt. Det är dock ett vanligt fenomen och det finns hjälp att få. Att reparera relationen efter otrohet är en systematisk process, oavsett vad den leder till. Det finns dock bara vinster med att vilja ställa saker till rätta och ta ansvar.\n\nInledningsvis behöver du känna att du trots känslomässigt kaos har rätt att bli respekterad och behandlad med omsorg. Senare kommer även du att behöva se din egen del, hur ditt agerande bidragit till situationen. Jag guidar dig/er genom processen på ett icke-dömande sätt så att ni båda kan röra er framåt. Du kommer att få förståelse för vad som händer med dig/er i olika skeden för att kunna stå upp för dina behov och samtidigt våga vara sårbar inför din partner.\n\nVarmt välkommen till Otrohetsakuten!',
      'intro_navbar_title': 'Välkommen',
	  'intro_prevent_title': 'Jag vill förebygga otrohet',
      'intro_prevent_text': 'Hej och varmt välkommen till Otrohetsakuten!\n\nJag ska ge dig/er den guidning ni behöver för att skapa trygghet i relationen. Att ”trygghetssäkra” relationen är ett förebyggande arbete som är bra att utföra tidigt. Detta för att motverka kriser som i sin tur kan leda till otrohet.\n\nObalans kan på sikt göra stor skada, varför det är viktigt att ta ansvar i ett tidigt skede. Rädsla för att uppfattas som en krävande partner kan vara ett skäl att låta bli. Vi har dock allt att vinna på att bli medvetna och skaffa kunskap om hur vi bäst vårdar vår relation. Att du har förväntningar och vågar ställa krav är nödvändigt för att vara en engagerad partner. Därför blir en ”empatisk” kommunikation som kännetecknas av ömsesidig respekt och omtanke viktig.\n\nJag guidar dig/er genom processen på ett icke-dömande sätt så att ni båda kan röra er framåt. Ni kommer att få kunskap och vägledning i hur ni skapar trygghet, tillit och glädje i relationen.\nVarmt välkommen till Otrohetsakuten!',
      'intro_skip': "Hoppa över",
	  'intro_responsibility_title': 'Jag vill ta ansvar för vem jag vill vara i relation',
      'intro_responsibility_text': 'Varmt välkommen till Otrohetsakuten!\n\nJag gissar att du har hittat hit för att du är nyfiken på hur du kan skapa och upprätthålla goda relationer, både med dig själv och med andra. Vi kan alltid sträva efter att bli vårt bästa jag, vilket bidrar till ökad livskvalitet och välmående. Allt handlar om hur vi har det i våra relationer. Och vår egen del i relationen kan bara vi själva ta ansvar för och arbeta på.\n\nHär kommer du att få stöd och guidning inom olika områden för att du bättre ska kunna ta ansvar för och uttrycka dina behov och önskemål. Det blir ett lärande för livet som jag hoppas att du har stor nytta och glädje av. Många har större fokus på att tillfredsställa andra än att lyssna på sig själva och ta ansvar för sina behov. Att inte överge sig själv är det bästa sättet att känna sig levande och också vara genuin i förhållande till andra. Det gör dig både intressant, tydlig och trygg att vara med.\n\nIngen förändringsprocess är enkel. Förhoppningsvis kommer de positiva erfarenheterna du får att göra dig mer motiverad att fortsätta.\n\nVarmt välkommen till Otrohetsakuten och lycka till med din utveckling!',
	  'intro_suspect_title': 'Jag misstänker otrohet',
      'intro_suspect_text': 'Hej och varmt välkommen till Otrohetsakuten!\n\nJag ska guida dig från en plats som för många kan vara skrämmande och ångestfylld. Du misstänker att din partner är otrogen, att hen ger uppmärksamhet till någon annan.\n\nMånga gånger är det värt att lyssna på sin magkänsla, den brukar sällan ha fel. Men har du blivit sviken tidigare så kan de emotionella såren göra dig extra känslig och vaksam. Att ständigt söka efter tecken på svek kan skada relationen. Därför är det viktigt att reflektera över situationen och få hjälp att hitta ett mer konstruktivt förhållningssätt. Din rädsla kan ställa till med mycket så du behöver själv bearbeta den. Förhoppningsvis kan du också få stöd från din partner i den processen.\n\nDet är vanligt med otrohet. Ibland har man också olika syn på vad otrohet är. Du behöver ta reda på – och vara tydlig med – var dina gränser går. I Otrohetsakuten kommer du att få stöd och guidning i vad du behöver göra för att ta ansvar för både dig själv och din relation.\n\nVarmt välkommen till Otrohetsakuten!',
	  'intro_title': 'Välkommen till\nOtrohetsakuten',
	  'intro_desc': 'Appen guidar dig i att bli trygg i relationen till dig själv och till din partner. Börja med att klicka på symbolen som passar in på dig.',

      'chat_introduction_closed': 'Chatten är stängd',
      'chat_introduction_info': 'Här kan du som prenumererar på appen ställa frågor som du önskar få svar på, som har anknytning till de områden som appen guidar i. Alla frågor behandlas med respekt och lyder under sekretess. Chatten är öppen torsdagar mellan klockan 13:00-15:00 (tidszon Stockholm, Sverige). I undantagsfall kan chattiden ändras till en annan dag eller tid. Nästa öppettid visas alltid på den röda knappen längre på den här sidan.\n\nTips:\nStäll en fråga i taget och försök att vara kortfattad och tydlig för att möjliggöra ett snabbt konstruktivt svar. Varje användare kan ställa högst två frågor var vid varje chattillfälle. Vid hög belastning kan svar dröja. Frågorna besvaras i turordning och vi gör vårt yttersta för att besvara ditt senaste meddelande så snart vi kan. När Chatten stänger kan du inte längre skicka fler meddelanden till oss. Ambitionen är att svara på alla frågor som ställs vid varje tillfälle.',
      'chat_introduction_navbar_title': 'Chatt',
      'chat_navbar_title': 'Chatt',
      'chat_introduction_open': 'Chatten är öppen',
      'chat_introduction_start': 'Börja chatta',
	  'chat_introduction_start_on': 'Börja på',
      'chat_introduction_title': 'Välkommen till Chatten!',
      'chat_enter_text': 'Meddelande',

	  'chat_page_delete':'Ta bort',
	  'chat_page_resend':'Skicka igen',

      'login_create_account': 'Har du inget konto? Skapa här',
      'login_email_hint': "Epost",
      'login_email_password_incorrect': "Eposten eller lösenordet är felaktigt.",
      'login_email_not_verified': "Eposten är inte verifierad. Vill du att vi skickar ett ny verifikationsmail?",
      'login_resend_email_verification': "Skicka verifikationsmail igen",
      'login_user_not_exist': "Användaren finns inte.",
      'login_forgot_password': 'Glömt lösenord?',
      'login_forgot_password_info': 'Skriv in den Epostadress du har skapat kontot med nedan',
      'login_forgot_password_reset': 'Återställ lösenord',
      'login_forgot_password_success': 'Ett mail med instruktioner har skickats till den adress du angav',
      'login_forgot_password_title': 'Glömt lösenord',
      'login_incorrect_email': 'Felaktig epostadress',
      'login_login': 'Logga in',
      'login_password_hint': 'Lösenord',
      'login_username_hint': 'Användarnamn',

      'overview_navbar_title': 'Översikt',
      'overview_previous_chapters_first': 'Du behöver göra klart alla föregående delar innan du kan gå vidare',

      'register_accept_terms_conditions': 'Acceptera allmänna villkor',
      'register_accept_terms_conditions_required': 'Du måste acceptera allmänna villkoren',
      'register_create_account': 'Skapa konto',
      'register_email_hint': 'Epost',
      'register_incorrect_email': 'Felaktig epostadress',
      'register_password_hint': 'Lösenord',
      'register_password_mismatch': 'Lösenorden är olika',
      'register_password_missing': 'Välj ett lösenord',
      'register_password_repeat_hint': 'Repetera lösenord',
	  'register_failed_to_create_account': 'Vi misslyckades att skapa ditt konto, prova igen',
	  'register_username_hint': 'Användarnamn (Visas endast för admin i chatten)',
	  'register_username_empty_message': 'Ange användarnamn',

      'settings_email': 'Epost',
      'settings_delete_user': 'Ta bort konto',
      'settings_delete_user_alert_title': 'Är du säker på att du vill ta bort ditt konto? All data du har skrivit försvinner och går ej att få tillbaka. Har du frågor kontakta supporten',
      'settings_logout': 'Logga ut',
      'settings_logout_alert_title': 'Är du säker?',
      'settings_navbar_title': 'Inställningar',
      'settings_password': 'Lösenord',
      'settings_subscription': 'Prenumeration',
      'settings_subscription_none': 'Ingen',
	  "settings_faq": "Frågor och svar",
	  'settings_terms_and_conditions': 'Allmänna villkor',
	  'settings_username': 'Användarnamn',
	  'settings_username_change_title': 'Ändra användarnamn (Visas endast för admin i chatten)',
	  'settings_update': 'Uppdatera',
	  'settings_password_change_title': 'Ändra lösenord',

	  'subscription_navbar_title': 'Otrohetsakuten prenumeration',
	  'subscription_subscribe': 'Prenumerera',
	  'subscription_restore': 'Återställ prenumeration',
	  'subscription_product_not_founds': 'Produkten hittades inte.',
	  'subscription_purchase_not_found': 'Inget köp hittades.',
	  'subscription_item_already_owned': 'Du har redan en prenumeration, vänligen återställ din prenumeration.',
	  'subscription_item_unavailable': 'Produkten finns inte',
	  'subscription_message': 'Du behöver köpa en månadsprenumeration för att få tillgång till alla funktioner i appen. Vi köp av en prenumeration får du tillgång till alla kapitel och chatt med en professionell rådgivare. Du har tillgång till alla delar under tiden din prenumeration löper.',
	  'subscription_note_title':'NOTERA:',
	  'subscription_note1': '- Betalning debiteras med 99 SEK för en månads prenumeration, därefter förnyas prenumeration månadsvis för 99 SEK per månad.',
       'subscription_note2': '- Betalning debiteras på iTunes-kontot vid bekräftelse av köp.',
	  'subscription_note2_android': '- Betalning debiteras på Android-kontot vid bekräftelse av köp.',
      'subscription_note3': '- Kontot debiteras för förnyelse inom 24 timmar före utgången av den aktuella perioden.',
	  'subscription_note4': '- Prenumerationen förnyas automatiskt ifall du inte säger upp det senaste 24 timmar innan slutdatumet.',
      'subscription_note5': '- Prenumerationer kan hanteras av användaren och automatisk förnyelse kan stängas av genom att gå till användarens kontoinställningar efter köp.',

	  'subscription_terms_message':'Genom att utföra ett köp godkänner du våra villkor.',
	  'subscription_terms_part1':'Läs mer om våra ',
	  'subscription_terms_part2':'Allmänna villkor och Integritets policy',
	  
	  "faqs_navbar_title": "Frågor & Svar",

	  "splash_logo":'images/logo_animated.gif',

	  'login_skip': "Hoppa över inloggning",
	  'login_required_message': "För att gå vidare i appen behöver du logga in. Att skapa ett konto är gratis. Vill du senare ta del av vårt premium material så som chatt och alla kapitel innehållande guidning, råd och relationsverktyg, tillkommer en kostnad.",
    'failed_register_notification':"Det gick inte att registrera anmälan"
    },
  };

  String getText(String tag) {
    String localizedValue = _localizedValues[locale.languageCode][tag];
    return localizedValue == null ? tag : localizedValue;
  }

  static String languageCode() {
	  if (AppLocalizations.shared.locale.languageCode == "en" || AppLocalizations.shared.locale.languageCode.startsWith("en-")) {
		  return "en-US";
	  }else{
		  return "sv-SE";
	  }
	  
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'sv'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    AppLocalizations.shared = new AppLocalizations(locale);
    return new SynchronousFuture<AppLocalizations>(AppLocalizations.shared);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

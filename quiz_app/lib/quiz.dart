class Quiz{
  final String question;
  List<String> options;
  
  Quiz({required this.question,required this.options});
}

List<Quiz> quizData = [
  Quiz(
    question: '1 Gigabyte (Gb) =',
    options: [
      '1,024 Mb',
      '1,000 Mb',
      '1,200 Mb',
      '1,275 Mb'
    ],
  ),
  Quiz(
    question: 'Which among the following controls all parts of the computer and known as the brain of computer?',
    options: [
      'CPU',
      'ROM',
      'RAM',
      'Processor'
    ]
  ),
  Quiz(
    question: 'The storage device, which retains data even after power cut, is known as …',
    options: [
      'Non-Volatine Storage',
      'Direct Storage',
      'Indirect Storage',
      'Volatine Storage'
    ]
  ),
  Quiz(
    question: 'A set of instructions or guidelines that commands computer how to perform a task is known as …',
    options: [
      'Program',
      'Software',
      'Hardware',
      'Store Data'
    ]
  ),
  Quiz(
    question: 'In reference to computer system, program has the similar meaning as of …', 
    options: [
      'Software',
      'Information',
      'Data',
      'Security System'
    ]
  ),
  Quiz(
    question: 'A person who uses his expertise to gain access of other’s computer illegally is known as …', 
    options: [
      'Hacker',
      'Programmer',
      'Spammer',
      'Developer'
    ]
  ),
  Quiz(
    question: 'In a network system, which among the following is the most powerful computer?', 
    options: [
      'Transmission Control Protocol',
      'File Transfer Protocol',
      'HTML',
      'HTTP'
    ]
  ),
  Quiz(
    question: ' Which among the following is the shortcut key to close the active window?', 
    options: [
      'Alt + F4',
      'Ctrl + F6',
      'Alt + F10',
      'Ctrl + L'
    ]
  ),
  Quiz(
    question: 'Which among the following is not a computer language?', 
    options: [
      'DRAM',
      'ALGOL',
      'COBOL',
      'PASCAL'
    ]
  ),
  Quiz(
    question: 'One of the major works of software is to transform data into ……', 
    options: [
      'Information',
      'Video',
      'Website',
      'Software Program'
    ]
  ),
];
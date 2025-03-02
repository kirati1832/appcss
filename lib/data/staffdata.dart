import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Map<String, List<Map<String, String>>> personnelData = {
  "อาจารย์": [
     {
      "name": "ผศ.ดร.สรร รัตนสัญญา",
      "english_name": "Asst.Prof.San Ratanasanya, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/SRS.jpg",
      "email": "san.r@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4628",
      "education": "Ph.D. (Electrical and Computer Engineering), King Mongkut’s University of Technology Thonburi|"
          "M.Eng. (Computer Engineering), King Mongkut’s University of Technology Thonburi|(Electrical Engineering), Sirindhorn Institute of Technology, Thammasat University",
      "research": "Visavakitcharoen, A., Ratanasanya, S., Polvichai, J., “Improving Thai Herb Image Classification using Convolutional Neural Networks with Boost up Features”, ITC-CSCC 2019, June 23-36, 2019, Jeju-Do, South Korea|Ratanasanya, S., Polvichai, J., Sirinaovakul, B., “Unsupervised Classification of Geometrical Data based on Particle Swarm Optimization”, TIMES-iCon 2018, Dec. 12-14, 2018, Bangkok, Thailand|Ratanasanya, S., Nilanan, K., Yongjittigorngul, C., Jaturon Harnsomburana, J., Sirinaovakul, B., Polvichai, J., “Adaptive Non-Linear AI for Game Using Q-Learning”, ICMEMIS 2018, Nov. 3-6, 2018, Kiryu, Gunma, Japan|Kesornsukhon, W., Visutsak, P., Ratanasanya, S., “Chromatic Aberration Detection based on Image Segmentation”, JCSSE2018, July 11-13, 2018, Nakhon Pathom, Thailand|Kesornsukhon, W., Visutsak, P., Ratanasanya, S., “Applying Image Segmentation for Detecting Chromatic Aberration”, to appear in International Scientific Conference on Engineering and Applied Sciences, June 27-29, 2018, Okinawa, Japan|Ratanasanya, S., Achalakul, T., Polvichai, P., “New Image Registration Framework based on Complex Wavelet and Local Descriptors”, The 32nd International Technical Conference on Circuits/Systems, Computers and Communications (ITC-CSCC2017), July, 2017, pp. 259-262|Ratanasanya, S., Chindapan, N., Polvichai, J., Sirinaovakul, B., Devahastin, S., “Particle swarm optimization as alternative tool to sensory evaluation to produce high-quality low-sodium fish sauce via electrodialysis”, Journal of Food Engineering, Vol 228 (2018), pp. 84-90|Ratanasanya, S., Chindapan, N., Polvichai, J., Sirinaovakul, B., Devahastin, S., “Model-based optimization of coffee roasting process: Model development, prediction, optimization and application to upgrading of Robusta coffee beans”, Journal of Food Engineering, Vol 318 (2021), pp. 1-13"
                  "|Udombuathong, P., Srisawasdi, R., Kesornsukhon, W., Ratanasanya, S., Application of artificial intelligence to assist hip fracture diagnosis using plain radiographs, Journal of Southeast Asian Medical Research, Vol 6 (2022), pp. 1-8"
                  "|Jariyavajee, C., Lamjiak, T., Ratanasanya, S., Fairee, S., Puphaiboon, K., Khompatraporn, C., Polvichai, J., Sirinaovakul, B., Cash stock strategies during regular and COVID-19 periods for bank branches by deep learning, PLOS ONE, Vol 17 (2022), pp. 1-23"
    },
    {
      "name": "ดร.ณัฐกิตติ์ จิตรเอื้อตระกูล",
      "english_name": "Dr. Natthaphon Jirapat",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/NJR.jpg",
      "email": "natthaphon.j@kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4610",
      "education": "Ph.D. in Artificial Intelligence, Stanford|M.Sc. in Data Science, Oxford|B.Sc. in Computer Engineering, KMUTNB",
      "research": "Deep Learning for Image Processing|Neural Networks in NLP|Robotic Vision System"
    },
    {
      "name": "รศ.ดร.กฤดาภัทร สีหารี",
      "english_name": "Assoc.Prof. Gridaphat Sriharee, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/GDP.jpg",
      "email": "gridaphat.s@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4603",
      "education": "Ph.D. in Computer Engineering, Chulalongkorn University|"
          "M.Sc. in Computer Science, NIDA|"
          "B.Sc. in Statistics, Khon Kaen University",
      "experience": "Postdoctoral Research Fellow, NTNU Norway|"
          "PhD Visiting Scholar, University of Georgia, USA",
      "expertise": "Semantic Processing|Ontology|Web and Software Engineering",
      "interest": "Semantic Analysis and NLP|Development of learning games|Data Science for Finance",
      "certificate": "AT*SQA Software Testing Certifications",
      "research": "Development of Question-Answering System for Learning Articles (2024)|"
          "Software Development Process Improvement (2022)|"
          "IoT and Data Analytics for Chicken Welfare (2022)|"
          "Self-Paced Learning using Tagging (2021)|"
          "ML Stock Prediction with Feature Selection (2024)",
      "books": "หลักภาษาโปรแกรม, KMUTNB Press, ISBN 978-616-368-102-7 (2565)|"
          "เว็บเชิงความหมาย, KMUTNB Press, ISBN 978-616-7701-28-8 (2556)"
    },
     {
      "name": "รศ.ดร.กอบเกียรติ สระอุบล",
      "english_name": "Assoc.Prof. Kobkiat Saraubon, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/KSB.jpg",
      "email": "kobkiat.s@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4626",
      "education": "Ph.D. in ICT for Education, KMUTNB|"
          "M.Sc. in Computer Science, KMUTNB|"
          "B.Eng. in Mechanical Engineering (First Class Honors), KMUTNB",
      "experience": "Professional Mechanical Engineer (กว. เครื่องกล)|"
          "More info: https://sites.google.com/view/kobkiat/",
      "expertise": "IoT & Mobile-based Systems|Smart Classroom & Learning Media|Cybersecurity & Botnet Detection",
      "interest": "AI for Education|Blockchain in Education|Mobile Augmented Learning",
      "certificate": "Certified Mechanical Engineer|AT*SQA Software Testing Certifications",
      "research": "IoT Telemonitoring System for Quarantine (2021)|"
          "Mobile Game for ESL Learning (2021)|"
          "Smart Classroom & Learning Repository (2019)|"
          "Blockchain-based Education Management (2019)|"
          "Augmented Book Design (2015)",
      "books": "Design of Smart Learning System, KMUTNB Press, ISBN 978-616-368-200-0 (2565)|"
          "Cybersecurity in IoT, KMUTNB Press, ISBN 978-616-7701-50-0 (2563)"
    },
     {
      "name": "รศ.ดร.ปรวัฒน์ วิสูตรศักดิ์",
      "english_name": "Assoc.Prof. Porawat Visutsak, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/PRV.jpg",
      "email": "porawat.v@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4612",
      "website": "https://porawat.com",
      "line_id": "0897771777",
      "education": "Ph.D. in Computer Science, KMITL|"
          "M.Sc. in Information Technology, KMUTT|"
          "B.Eng. in Industrial Engineering, Kasetsart University",
      "expertise": "Machine Learning & AI|Computer Vision|Medical Image Processing",
      "interest": "AI for Elderly Care|Neural Networks for Pattern Classification|Ontology-based Retrieval Systems",
      "research": "Thai Weaving Pattern Classification (2021)|"
          "Elderly Exercise Joint Detection (2021)|"
          "Activity Classification for Elderly (2021)|"
          "Ontology-Based Semantic Retrieval for Durian Pest Control (2021)|"
          "3D Medical Visualization using Marching Cubes (2020)"
    },
     {
      "name": "รศ.ดร.เบญจพร ลิ้มธรรมาภรณ์",
      "english_name": "Assoc.Prof. Benchaphon Limthanmaphon, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/BLT.jpg",
      "email": "benchaphon.l@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4625",
      "education": "Ph.D. in Computer Science, University of Southern Queensland, Australia|"
          "M.Sc. in Computer Science, Chulalongkorn University, Thailand|"
          "B.Sc. in Applied Computer Science, KMUTNB, Thailand",
      "expertise": "Cybersecurity|Computer System Security|Web Intelligence|E-Commerce Security|IoT Security",
      "interest": "Penetration Testing|Security in Web Services|AI in Cybersecurity",
      "awards": "Fulbright Thai Visiting Scholarship (Yale University, 2021-2022)|"
          "Enterprise Software Cooperation Project (India, 2007)|"
          "Royal Thai Government Scholarship (1998-2003)",
      "research": "IoT-based Smart Farm Control System (2024)|"
          "Voice-controlled Emoji LED Car Display (2023)|"
          "IoT Telemonitoring System for Quarantine (2021)|"
          "Security Enhancement on ECC Dynamic Point Encoding for IoT (2020)|"
          "Handwritten Signature Authentication using AI (2019)|"
          "Adaptive Android Malware Signature Detection (2018)|"
          "Two-factor Image-based Password Authentication (2017)"
    },
    {
      "name": "ผศ.ดร.เฉียบวุฒิ รัตนวิไลสกุล",
      "english_name": "Asst.Prof. Chiabwoot Ratanavilisagul, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/CHR.jpg",
      "email": "chaibwoot.r@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4620",
      "contact": "LINE",
      "education": "Ph.D. in Electrical Engineering, KMITL|"
          "M.Eng. in Computer Engineering, KMITL|"
          "B.Eng. in Computer Engineering, KMITL",
      "expertise": "Particle Swarm Optimization|Metaheuristic Algorithms|Machine Learning",
      "interest": "Swarm Intelligence|Data Clustering|Ant Colony Optimization",
      "research": "Mutation Period Calculation for PSO (ISTS 2011)|"
          "Selective Crossover for Multi-Swarm Optimization (ICETCIP)|"
          "Modified PSO with Dynamic Re-initialization (IC2IT 2014)|"
          "Modified PSO with Dynamic Mutation (ECTI)|"
          "Modified Ant Colony Optimization for TSP (ECTI-CON 2017)|"
          "Modified ACO with Leader and Reset Pheromone (ICEAST 2018)|"
          "Novel ACO Algorithm for Vehicle Routing Problem (ICICIA 2021)",
    },
     {
      "name": "ผศ.สถิตย์ ประสมพันธ์",
      "english_name": "Asst.Prof. Sathit Prasomphan",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/SSP.jpg",
      "email": "sathit.p@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4621",
      "education": "M.Sc. in Software Engineering, Chulalongkorn University|"
          "B.Sc. in Computer Science, Khon Kaen University",
      "expertise": "Deep Learning|Computer Vision|Natural Language Processing",
      "interest": "Image Retrieval|Speech Recognition|Ensemble Learning",
      "research": "Chatbot Improvement for Trading Systems (ICCCBDA 2019)|"
          "Traffic Sign Detection using CNN (HPCCT 2019)|"
          "Human Emotion Detection via Speech (EAI BigDataTech 2017)|"
          "Feature Extraction for Thai Traditional Painting (CCIS 2017)|"
          "Rice Bacterial Infection Detection using UAV (CSSE 2023)|"
          "Fine-grained Image Retrieval with Adaptive Deep Learning (CSSE 2023)"
    },
     {
      "name": "อาจารย์เอิญ สุริยะฉาย",
      "english_name": "Earn Suriyachay",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/ENS.jpg",
      "email": "earn.s@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4614",
      "education": "M.E. in Information and Computer Science, Chiba University, Japan|"
          "B.Sc. in Physics, Kasetsart University",
      "expertise": "Natural Language Processing|Machine Learning|Data Analysis",
      "interest": "Short Text Representation|Word Semantic Correlations",
      "research": "Learning Short Text Representation using NMF (ICAAI 2019)"
    },
    {
      "name": "อาจารย์ณัฐวุฒิ สร้อยดอกสน",
      "english_name": "Nuttawut Sroidokson",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/NSD.jpg",
      "email": "nuttawut.s@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4619",
      "education": "M.Sc. in Information Technology, KMUTNB|"
          "B.Eng. in Industrial Electrical Technology, KMUTNB",
      "expertise": "Information Technology|Electrical Technology",
      "interest": "Embedded Systems|Industrial Automation",
      "research": "ยังไม่มีข้อมูลผลงานทางวิชาการ"
    },
    {
      "name": "อาจารย์อนุสรณ์ วงษ์สนิท",
      "english_name": "Anusorn Wongsanit",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/AWS.jpg",
      "email": "anusorn.w@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4624",
      "education": "B.Sc. in Applied Computer Science, KMUTNB",
      "expertise": "Computer Science|Software Development",
      "interest": "AI and Machine Learning|Web Development",
      "research": "ยังไม่มีข้อมูลผลงานทางวิชาการ"
    },
    {
      "name": "อาจารย์ยนต์ชนก เขาแก้ว",
      "english_name": "Yonchanok Khaokaew",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/YCK.jpg",
      "email": "yonchanok.k@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 0",
      "education": "B.Sc. in Computer Science, KMUTNB|M.Sc. in Computer Science, KMUTNB",
      "expertise": "ยังไม่มีข้อมูล",
      "interest": "ยังไม่มีข้อมูล",
      "research": "ยังไม่มีข้อมูลผลงานทางวิชาการ",
      "status": "ลาศึกษาต่อ"
    },
    {
      "name": "ผศ.ดร.ธรรศฏภณ สุระศักดิ์",
      "english_name": "Asst.Prof. Thattapon Surasak, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/TSR.jpg",
      "email": "thattapon.s@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4629",
      "education": "Ph.D. in Communications Engineering, National Tsing Hua University, Taiwan|M.Sc. in Telecommunications Engineering, University of Sunderland, United Kingdom|B.Eng. in Computer Engineering, Kasetsart University, Thailand",
      "expertise": "Blockchain, AI, IoT, Deep Learning",
      "interest": "Smart Healthcare, Cybersecurity, AI-driven Systems",
      "research": "Blockchain-Enhanced Security and Efficiency for Thailand’s Health Information System|A deep reinforcement learning system for the allocation of epidemic prevention materials|A secure annuli CAPTCHA system|Thai Agriculture Products Traceability System using Blockchain and IoT",
      "status": "ปฏิบัติงาน"
    },
    {
      "name": "ดร.ณัฐกิตติ์ จิตรเอื้อตระกูล",
      "english_name": "Nattagit Jiteurtragool, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/NJR.jpg",
      "email": "nattagit.j@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ -",
      "education": "Ph.D. in Electrical Engineering, Kochi University of Technology, Japan|M.Sc. in Electrical Engineering, Kochi University of Technology, Japan|B.Eng. in Computer Engineering, Thai-Nichi Institute of Technology",
      "expertise": "Chaotic Systems, Cryptography, Random Number Generation, AI for Engineering",
      "interest": "Secure Communications, AI-Driven Power Systems, IoT Security",
      "research": "Robustification of a One Dimensional Generic Sigmoidal Chaotic Map|Hybrid random number generator based on chaotic oscillator|True Random Number Generator Based on Compact Chaotic Oscillator|A Power Control System in DC-DC Boost Converter Integrated with Photovoltaic Arrays",
      "status": "ปฏิบัติงาน"
    },
    {
      "name": "ผศ.ดร.อภิสิทธิ์ รัตนาตรานุรักษ์",
      "english_name": "Asst.Prof. Apisit Rattanatranurak, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/ART.jpg",
      "email": "apisit.r@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ -",
      "education": "Ph.D. in Electrical Engineering, KMITL|M.Eng. in Computer Engineering, KMITL|B.Eng. in Computer Engineering, KMITL",
      "expertise": "Parallel Computing, Sorting Algorithms, High-Performance Computing",
      "interest": "OpenMP Optimization, Augmented Reality in Education, Smart Classroom Development",
      "research": "Parallel Multi-Deque Partition Dual-Deque Merge Sorting Algorithm|Optimizing MultiStack Parallel (MSP) Sorting Algorithm|A Parallel Triple-Pivot Sorting Algorithm (PTPSort)|Development Request Form Web Application for Students",
      "status": "ปฏิบัติงาน"
    }
  ],
  "ผู้บริหารภาค": [
    {
      "name": "ผศ.ดร.อัครา ประโยชน์",
      "english_name": "Asst.Prof. Akara Prayote, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/ADP.jpg",
      "email": "akara.p@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4610",
      "education": "Ph.D. in Computer Science, UNSW Australia|"
          "M.Sc. in Computer Science, AIT Thailand|"
          "B.Sc. in Applied Computer Science, KMUTNB",
      "research": "Prayote, A., Songklang, K. (2018). 'Temporal Topic Correlation and Evolution,' "
          "JCSSE 2018, Nakhon Pathom, Thailand, (July 11-13), pp.1-6.|"
          "Songklang, K., Prayote, A., (2018). 'Discovery and Visualization of Expertise Evolution and Tendency,' "
          "KST 2018, Chiang Mai, Thailand, (Jan. 31 - Feb. 3), pp. 68-73.|"
          "Kheaksong, A., Srisomboon, K., Prayote, A., Lee, W. (2018). "
          "'Multicriteria Parent Selection Using Cognitive Radio for RPL in Smart Grid Network,' "
          "Wireless Communications and Mobile Computing, vol.2018, (February 2018), pp.1-13.|"
          "Prayote, A. and Kuntichod, A. (2017). ‘Multi-Role Identification of Sentences using Relevance Vector Space,’ "
          "JCSSE 2017, Nakhon Si Thammarat, Thailand, (July 12-14), pp.1–6.|"
          "Lee, W., Kaeksong, A. and Prayote, A. (2016). ‘Performance Evaluation of Smart Grid Communications via Network Simulation 3,’ "
          "ECTI-CON 2016, Chiang Mai, Thailand, (June 28-July 1), pp. 1-6.|"
          "Lee, W., Srisomboon, K. and Prayote, A. (2016). ‘Fast Spectrum Sensing with Coordinate System in Cognitive Radio Networks,’ "
          "ETRI Journal. 37(3), (June 2015), pp. 1-10.|"
          "Srisomboon, K., Prayote, A. and Lee, W. (2015). ‘Double Constraints Adaptive Energy Detection for Spectrum Sensing in Cognitive Radio Networks,’ "
          "ICMU 2015, Hakodate City, Hokkaido, Japan, (January 20-22), pp. 1-6.|"
          "Srisomboon, K., Prayote, A. and Lee, A. (2015). ‘Two-stage Spectrum Sensing for Cognitive Radio under Noise Uncertainty,’ "
          "ICMU 2015, Hakodate City, Hokkaido, Japan, (January 20-22), pp. 1-6."
    },
    {
      "name": "ผศ.ดร.ลือพล พิพานเมฆาภรณ์",
      "english_name": "Asst.Prof. Luepol Pipanmekaporn, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/LPP.jpg",
      "email": "luepol.p@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4615",
      "education": "Ph.D. in Computer Science, Queensland University of Technology, Australia|"
          "M.Sc. in Computer Science, Thammasat University, Thailand|"
          "B.Eng. in Computer Engineering, Rajamangala University of Technology Thanyaburi, Thailand",
      "research": "Luepol Pipanmekaporn, S. Kamonsantiroj, E. Suriyachay (2019). "
          "'Learning Short Text Representation using Non-Negative Matrix Factorization and Word Semantic Correlations,' "
          "8th International Congress on Advanced Applied Informatics, Toyama, Japan (July 7-12), pp. 617-622.|"
          "Karnthaapha, P., Pipanmaekaporn, L. and Kamonsantiroj, S. (2018). "
          "'Topic-based User Profile Model for POI Recommendations,' "
          "2nd International Conference on Intelligent Systems, Metaheuristics and Swarm Intelligence, Phuket, Thailand, (March 24-25), pp. 143-147.|"
          "Pipanmaekaporn, L., Wichinawakul, P. and Kamonsantiroj, S. (2017). "
          "'Mining Accelerometer Data for Smartphone-fall detection,' "
          "10th KST International Conference on Knowledge and Smart Technology, Chiangmai, Thailand, (Jan. 31 – Feb. 3), pp. 74-79.|"
          "Kamonsantiroj, S., Wannatrong, L. and Pipanmaekaporn, L. (2017). "
          "'Improving Pitch Class Profile for Musical Chords Recognition Combining Major Chord Filters and Convolution Neural Networks,' "
          "6th IIAI International Conference on Advanced Applied Informatics, Shizuoka, Japan, (July 9-13), pp. 880-885.|"
          "Pornsupikul, S., Pipanmaekaporn, L. and Kamonsantiroj, S. (2017). "
          "'Mining from VMS data for identifying fishing tackles,' "
          "2nd International Conference on Robotics, Control and Automation (ICRCA '17), Kitakyushu, Japan, (Sep. 15–18), pp. 35-40.|"
          "Pipanmaekaporn, L. and Kamonsantiroj, S. (2017). "
          "'Enhancing Topic Models for Short Text using Deep Autoencoder,' "
          "9th International Conference on Computer and Future Communication (ICFCC 2017), Nagoya, Japan, (Apr. 21-23), pp. 392-397.|"
          "Sumana, Y., Kamonsantiroj S., and Pipanmaekaporn L. (2017). "
          "'Concurrent Test Case Generation for UML Activity Diagram Based on Dynamic Programming,' "
          "6th International Conference on Software and Computer Applications (ICSCA 2017), Bangkok, Thailand, (Feb. 26-28), pp. 33-38.|"
          "Panyapanuwat, P., Kamonsantiroj, S. and Pipanmaekaporn, L. (2017). "
          "'Time-Frequency Ratio Hashing for Content-Based Audio Retrieval,' "
          "9th International Conference on Knowledge and Smart Technology (KST 2017), Chon Buri, Thailand, (Feb. 1-4), pp. 205-210."
    },
    {
      "name": "ผศ.ดร.สุวัจชัย กมลสันติโรจน์",
      "english_name": "Asst.Prof. Suwatchai Kamonsantiroj, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/SWK.jpg",
      "email": "suwatchai.k@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4616",
      "education": "Ph.D. in Computer Engineering, Kasetsart University, Thailand|"
          "M.Sc. in Information Technology Management, Mahidol University, Thailand|"
          "B.Eng. in Mechanical Engineering, KMUTNB, Thailand",
      "research": "Karnthaapha, P., Pipanmaekaporn, L. and Kamonsantiroj, S. (2018). "
          "'Topic-based User Profile Model for POI Recommendations,' "
          "2nd International Conference on Intelligent Systems, Metaheuristics and Swarm Intelligence, Phuket, Thailand, (March 24-25), pp. 143-147.|"
          "Pipanmaekaporn, L., Wichinawakul, P. and Kamonsantiroj, S. (2017). "
          "'Mining Accelerometer Data for Smartphone-fall detection,' "
          "10th KST International Conference on Knowledge and Smart Technology, Chiangmai, Thailand, (Jan. 31 – Feb. 3), pp. 74-79.|"
          "Kamonsantiroj, S., Wannatrong, L. and Pipanmaekaporn, L. (2017). "
          "'Improving Pitch Class Profile for Musical Chords Recognition Combining Major Chord Filters and Convolution Neural Networks,' "
          "6th IIAI International Conference on Advanced Applied Informatics, Shizuoka, Japan, (July 9-13), pp. 880-885.|"
          "Pornsupikul, S., Pipanmaekaporn, L. and Kamonsantiroj, S. (2017). "
          "'Mining from VMS data for identifying fishing tackles,' "
          "2nd International Conference on Robotics, Control and Automation (ICRCA '17), Kitakyushu, Japan, (Sep. 15–18), pp. 35-40.|"
          "Pipanmaekaporn, L. and Kamonsantiroj, S. (2017). "
          "'Enhancing Topic Models for Short Text using Deep Autoencoder,' "
          "9th International Conference on Computer and Future Communication (ICFCC 2017), Nagoya, Japan, (Apr. 21-23), pp. 392-397.|"
          "Sumana, Y., Kamonsantiroj S., and Pipanmaekaporn L. (2017). "
          "'Concurrent Test Case Generation for UML Activity Diagram Based on Dynamic Programming,' "
          "6th International Conference on Software and Computer Applications (ICSCA 2017), Bangkok, Thailand, (Feb. 26-28), pp. 33-38.|"
          "Panyapanuwat, P., Kamonsantiroj, S. and Pipanmaekaporn, L. (2017). "
          "'Time-Frequency Ratio Hashing for Content-Based Audio Retrieval,' "
          "9th International Conference on Knowledge and Smart Technology (KST 2017), Chon Buri, Thailand, (Feb. 1-4), pp. 205-210."
    },
    {
      "name": "อาจารย์ปรัชญาพร เลี้ยงสุทธิสกนธ์",
      "english_name": "Prachyaporn Liangsutthisakon",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/PLS.jpg",
      "email": "prachyaporn.l@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4619",
      "education": "M.S. in Information Science, University of Pittsburgh, USA|"
          "M.S. in Telecommunications, University of Pittsburgh, USA|"
          "B.Sc. in Applied Mathematics, Prince of Songkla University, Thailand",
      "research": "ปริเยศ ทรัพย์สินพันธ์ และ ปรัชญาพร  เลี้ยงสุทธิสกนธ์, "
          "“การประยุกต์ใช้ระบบสารสนเทศทางภูมิศาสตร์ในการติดตามและช่วยเหลือผู้ป่วยโรคความดันโลหิตสูง,” "
          "Proceedings of ECTI-CARD 2009.|"
          "H. A. Karimi, P. Krishnamurthy, and P. Liangsutthisakon, "
          "“Real-Time Routing in Mobile Networks Using GPS and GIS Techniques,” "
          "HICSS'2000, January 2000.|"
          "P. Krishnamurthy, H. Karimi, and P. Liangsutthisakon, "
          "“Telegeoinformatics: A Novel Approach Towards Efficient Resource Allocation and Application and Protocol Development for Wireless Communications,” "
          "Proceedings of PDPTA'2000.|"
          "P. Liangsutthisakon, P. Krishnamurthy, and H. Karimi, "
          "“An Efficient and Accurate Handoff Procedure Through the Utilization of Telegeoinformatics in Wireless Communications,” "
          "Proceedings of AIT conference, Thailand, 2000."
    },
    {
      "name": "รศ.ดร.ธนภัทร์ อนุศาสน์อมรกุล",
      "english_name": "Assoc.Prof. Tanapat Anusas-amornkul, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/TNA.jpg",
      "email": "tanapat.a@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4621",
      "education": "Ph.D. in Information Science, University of Pittsburgh, USA|"
          "M.S. in Telecommunications, University of Colorado at Boulder, USA|"
          "B.Eng. in Electrical Engineering, Kasetsart University, Thailand",
      "research": "N. Bussabong and T. Anusas-amornkul, "
          "“Enhanced Keystroke Dynamics Authentication Using Keystroke Vector Dissimilarity,” "
          "2023 15th International Conference on Information Technology and Electrical Engineering (ICITEE), Chiang Mai, Thailand, 2023, pp. 223-228.|"
          "T. Anusas-Amornkul, K. Intarak and B. Limthanmaphon, "
          "“Security Enhancement on ECC Dynamic Point Encoding for IoT,” "
          "2020 Fourth World Conference on Smart Trends in Systems, Security and Sustainability (WorldS4), London, UK, 2020, pp. 443-448.|"
          "Runsungnoen M., Anusas-amornkul T. (2020) "
          "“Round Robin Scheduling Based on Remaining Time and Median (RR_RT&M) for Cloud Computing.” "
          "In: Smart Trends in Computing and Communications. Smart Innovation, Systems and Technologies, vol 165. Springer, Singapore, pp 21-29, Dec 4, 2019.|"
          "Anusas-Amornkul, T. (2019). “Strengthening Password Authentication using Keystroke Dynamics and Smartphone Sensors.” "
          "In Proceedings of the 9th International Conference on Information Communication and Management - ICICM 2019. "
          "Prague, Czech Republic, (August 23-26), pp.70–74.|"
          "Pornchaiyasutthi, T. and Anusas-Amornkul, T. (2019). "
          "“A Model for Victim-Rescuer Communications under Collapsed Structures using Node MCU ESP8266.” "
          "In Proceedings of the 2019 2nd International Conference on Electronics Communications and Control Engineering - ICECC 2019. "
          "Phuket, Thailand, (April 13-16), pp.34–38.|"
          "Anusas-Amornkul, T. (2018). “A Network Root Cause Analysis and Repair System.” "
          "In Proceedings of 2018 6th International Symposium on Computational and Business Intelligence (ISCBI). "
          "Basel, Switzerland, (August 27-29), pp.69–73.|"
          "Anusas-Amornkul, T. and Sangrat, S. (2017). “Linux Server Monitoring and Self-healing System Using Nagios.” "
          "Mobile Web and Intelligent Information Systems Lecture Notes in Computer Science. "
          "Prague, Czech Republic, (August 21-23), pp.290–302.|"
          "Moonsin, S. and Anusas-Amornkul, T. (2017). "
          "“Bandwidth and buffer-based (B2)-dynamic adaptive streaming over HTTP.” "
          "2017 10th International Conference on Ubi-Media Computing and Workshops (Ubi-Media). "
          "Pattaya, Thailand, (August 1-4), pp.1–6.|"
          "Cherdmuangpak, N. and Anusas-Amornkul, T., and Limthanmaphon, B. (2017). "
          "“Two factor image-based password authentication for junior high school students.” "
          "In Proceedings of 2017 14th International Joint Conference on Computer Science and Software Engineering (JCSSE). "
          "Nakhon Si Thammarat, Thailand, (July 12-14), pp.1–6."
    },
     {
      "name": "ผศ.ดร.คันธารัตน์ อเนกบุณย์",
      "english_name": "Asst.Prof. Khantharat Anekboon, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/KAB.jpg",
      "email": "khantharat.a@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4613",
      "education": "Ph.D. in Computer Science (International Program), Chulalongkorn University|"
          "M.Sc. in Information Technology (International Program), KMUTNB|"
          "B.Sc. in Computer Science, Thammasat University",
      "research": "Kamthang, V., & Anekboon, K. (2024). White Leg Shrimp Larvae Counting System. "
          "2024 16th International Conference on Knowledge and Smart Technology (KST), 201-206.|"
          "Khantharat Anekboon and Nattapat Pratchayatiwat. (2023). Backhoe Detection in Surveillance Area from Aerial Imagery. "
          "In Proceedings of the 2023 International Joint Conference on Robotics and Artificial Intelligence (JCRAI '23).|"
          "คันธารัตน์ อเนกบุณย์. (2561). DFP-Cosine Similarity สำหรับการวัดความเหมือนของประโยคด้วย Latent Semantic Analysis. "
          "การประชุมวิชาการครั้งที่ 3 มหาวิทยาลัยเกษตรศาสตร์ วิทยาเขตศรีราชา, ชลบุรี, (30 สิงหาคม 2561), หน้า 134-141.|"
          "Anekboon, K. (2018). Automated scoring for short answering subjective test in Thai’s language. "
          "In Proceedings of 2018 International Conference on Image, Video Processing and Artificial Intelligence, Shanghai, China.|"
          "Anekboon, K. (2018). Feature selection for Bloom's question classification in Thai language. "
          "Intelligent Computing. SAI 2018. Advances in Intelligent Systems and Computing, vol 858, Springer.|"
          "Sriharee, G. and Anekboon, K. (2016). Multiple aspect ranking for researcher expertise finding. "
          "In Proceedings of 2016 IEEE International Conference on Knowledge Engineering and Applications (ICKEA), Singapore.|"
          "Khantharat Anekboon, Chidchanok Lursinsap, Suphakant Phimoltares, Suthat Fucharoen, Sissades Tongsima (2014). "
          "Extracting predictive SNPs in Crohn's disease using a vacillating genetic algorithm and a neural classifier in case-control association studies. "
          "Comput. Biol. Medicine 44: 57-65.|"
          "K. Anekboon, S. Phimoltares, C. Lursinsap, S. Tongsima and S. Fucharoen (2010). "
          "Searching Single Nucleotide Polymorphism Markers to Complex Diseases Using Genetic Algorithm Framework and a BoostMode Support Vector Machine. "
          "2010 4th International Conference on Bioinformatics and Biomedical Engineering, Chengdu, China."
    }, {
      "name": "ผศ.ดร.นิกร สุทธิเสงี่ยม",
      "english_name": "Asst.Prof. Nikorn Sutthisangiam, Ph.D.",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/NKS.jpg",
      "email": "nikorn.s@sci.kmutnb.ac.th",
      "phone": "0-2555-2000 ต่อ 4618",
      "education": "Doctor of Engineering in Electrical Engineering, RWTH Aachen University, Germany|"
          "M.Sc in Communication Engineering, The Sirindhorn International Thai-German Graduate School of Engineering|"
          "B.Eng. in Electrical Engineering, KMUTNB",
      "research": "Daruthep P., Sutthisangiam N. (2020). Development of Automated Processing for High-Definition Mapping System. "
          "IEEE 22nd International Conference on Advanced Communication Technology (ICACT2020), South Korea.|"
          "Pongpunpurt P., Khawsuk W., Sutthisangiam N. (2019). Development of Huffman Code for LORA Technology. "
          "5th IEEE Smart World Congress (SmartWorld 2019), United Kingdom.|"
          "Yaemjaem, A., Sutthisangiam, N., Sompan, A., Sa-ngiam, A., and Jindasee, P. (2018). "
          "Development of High-Definition 3D Mapping System for Water Resources Management. "
          "5th International Conference on Advanced Informatics : Concept Theory and Applications (ICAICTA), Krabi, Thailand.|"
          "Phuengsaeng, P. and Sutthisangiam, N. (2018). Automatic Corrective Elevation of GPS Trajectory in Urban Area. "
          "18th International Symposium on Communications and Information Technologies (ISCIT 2018), Bangkok, Thailand.|"
          "Bamrungpruk, S. and Sutthisangiam, N. (2018). Software-based Timing Synchronization for Point Cloud Reconstruction. "
          "International Conference on Intelligent Informatics and Biomedical Sciences (ICIIBMS 2018), Bangkok, Thailand.|"
          "Imlimtan, K. and Sutthisangiam, N. (2018). Realtime WIFI Mapping Using Smart Phone Sensors with Personal Dead-Reckoning Technique. "
          "Electrical Engineering Electronics, Computer, Telecommunications and Information Technology (ECTI), Chiang Rai, Thailand.|"
          "Duangsri, W., Somrobru, M., and Sutthisangiam, N. (2018). Performance Enhancement for Co-Channel Interference Cancellation "
          "with Smart Antenna and Power Adaptive in Cooperative Communication. "
          "20th International Conference on Advanced Communication Technology (ICACT2018), South Korea."
    }
  ],
  "บุคลากรสนับสนุน": [
    {
      "name": "นายฐิตินันท์ ขันทอง",
      "english_name": "ช่างอิเล็กทรอนิกส์",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/FAH.jpg",
      "email": "titinan.k@sci.kmutnb.ac.th",
      "phone": "",
      "education": "",
      "research": ""
    },
    {
      "name": "นางสาวอาลิษา หุ่นไทย",
      "english_name": "เจ้าหน้าที่บริหารงานทั่วไป",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/MEAW.jpg",
      "email": "alisa.h@sci.kmutnb.ac.th",
      "phone": "",
      "education": "",
      "research": ""
    },
    {
      "name": "นางสาวจันทิมา อรรฆรุจิรัตน์",
      "english_name": "นักวิชาการศึกษา",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/WHAN.jpg",
      "email": "jantima.p@sci.kmutnb.ac.th",
      "phone": "",
      "education": "",
      "research": ""
    },
    {
      "name": "นายเกรียงไกร เอี่ยมวงค์",
      "english_name": "ช่างเทคนิค",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/GAME.jpg",
      "email": "kriangkrai.a@sci.kmutnb.ac.th",
      "phone": "",
      "education": "",
      "research": ""
    },
    {
      "name": "นายนที ปัญญาประสิทธิ์",
      "english_name": "เจ้าหน้าที่บริหารงานทั่วไป",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/WAVE.jpg",
      "email": "natee.p@sci.kmutnb.ac.th",
      "phone": "",
      "education": "",
      "research": ""
    },
    {
      "name": "นางสาวอุษณีย์ บัลลังน้อย",
      "english_name": "นักวิชาการคอมพิวเตอร์",
      "image": "http://202.44.40.179/DATA_From_chiab/Image/img/Personnel/SAH.jpg",
      "email": "ousanee.b@sci.kmutnb.ac.th",
      "phone": "",
      "education": "",
      "research": ""
    },
  ],
};
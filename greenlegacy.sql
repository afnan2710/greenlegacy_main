-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2025 at 02:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lg`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('consultant','admin','editor') NOT NULL DEFAULT 'admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Afnan', 'info.afnan27@gmail.com', '$2y$10$371Ug7ptUz3v3nScmyS9XeSnabaITL2hP4jJhK8L9A1e5Ryn2aIFy', 'admin', '2025-05-29 10:37:55'),
(3, 'Abir', 'abir@gmail.com', '$2y$10$El47sEYRLKGnI31m3DCCYOcaFamg4MCYMwhZY0nHJuAOhSuWK3vF.', 'editor', '2025-07-14 12:10:24'),
(4, 'Mst. Sumaiya Akter', 'mail.afnan2710@gmail.com', '$2y$10$i5c6iRb8G2cxueIJ8z3cjeqiww1T5/R.DGoWxYbTWWF1kC3KRo2VK', 'consultant', '2025-07-14 12:30:15');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `consultant_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_slot` int(11) NOT NULL COMMENT 'Index of time slot (0-6 for predefined slots)',
  `status` enum('pending','confirmed','completed','cancelled') DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `consultant_id`, `date`, `time_slot`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(4, 1, 4, '2025-08-23', 1, 'pending', '', '2025-08-01 11:03:39', '2025-08-18 12:34:58'),
(6, 1, 4, '2025-08-18', 6, 'pending', '', '2025-08-16 18:51:37', '2025-08-18 12:34:57'),
(7, 1, 4, '2025-09-01', 2, 'pending', 'help!!!', '2025-08-18 12:04:12', '2025-08-18 12:34:33');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `button_text` varchar(50) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `position` int(11) DEFAULT 0,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `description`, `image_path`, `link`, `button_text`, `is_active`, `position`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(4, '', '', 'uploads/banners/688cff65bcf4b.png', '', '', 1, 1, NULL, NULL, '2025-08-01 17:24:01', '2025-08-01 17:54:45'),
(6, '', '', 'uploads/banners/688d029007e8b.png', 'http://greenlegacy/shop.php', 'Explore Shop', 1, 2, NULL, NULL, '2025-08-01 18:03:26', '2025-08-16 15:51:10'),
(7, '', '', 'uploads/banners/688d08b47a127.png', 'http://greenlegacy/appointments.php', 'Book Consultation Now!', 1, 3, NULL, NULL, '2025-08-01 18:26:57', '2025-08-16 15:51:29'),
(8, '', '', 'uploads/banners/688d0a36c5f1f.png', '', '', 1, 4, NULL, NULL, '2025-08-01 18:40:54', '2025-08-01 18:40:54');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `meta_description` varchar(160) DEFAULT NULL,
  `status` enum('draft','pending','published','rejected') NOT NULL DEFAULT 'draft',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `published_at` datetime DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `content`, `author_id`, `tags`, `featured_image`, `meta_description`, `status`, `created_at`, `updated_at`, `published_at`, `approved_by`) VALUES
(22, 'The Rise of Indoor Gardening', 'Indoor gardening has seen a surge in popularity, especially among urban dwellers. With limited outdoor space, people are turning to houseplants to bring a touch of nature indoors. The benefits go beyond aesthetics—plants can purify air, improve mental health, and even boost productivity. As more people recognize these advantages, the trend is expected to grow further. In this blog, we will explore the most popular indoor plants, their care tips, and how to design a green space in your apartment.', 1, 'gardening,indoor,nature', 'uploads/blogs/blog_1754413272_2e7007d2.png', 'Indoor gardening is transforming urban homes. Discover the best plants and care tips.', 'published', '2025-08-05 16:47:01', '2025-08-05 17:01:12', '2025-08-01 10:00:00', 1),
(23, 'Sustainable Gardening Practices for the Eco-Conscious', 'Sustainability is no longer just a buzzword—it’s a necessity. In the gardening world, being eco-conscious means using compost, avoiding harmful pesticides, and conserving water. This blog dives into how gardeners can adopt practices that are better for the planet and their plants. From rainwater harvesting to permaculture methods, we’ll give you the knowledge to garden with a conscience.', 4, 'sustainability,eco-friendly,gardening', 'uploads/blogs/blog_1754413369_16706b11.png', 'Learn how to garden sustainably with compost, rainwater, and permaculture techniques.', 'published', '2025-08-05 16:47:01', '2025-08-05 17:02:49', '2025-08-02 14:30:00', 1),
(24, '5 Common Plant Diseases and How to Prevent Them', 'No gardener wants to see their plants wilt and die unexpectedly. Many plant diseases are preventable with the right knowledge and care. In this detailed guide, we break down five common plant diseases, their symptoms, and prevention methods. Topics include root rot, powdery mildew, blight, and more. Keep your plants healthy by learning the early warning signs.', 1, 'plants,diseases,plant care', 'uploads/blogs/blog_1754413447_e75bda5f.png', 'Identify and prevent 5 common plant diseases before they harm your garden.', 'published', '2025-08-05 16:47:01', '2025-08-05 17:04:07', '2025-08-03 09:45:00', 1),
(25, 'How to Start a Balcony Garden from Scratch', 'Don’t have a backyard? No problem! Balcony gardens are a great solution for urban gardeners. In this comprehensive guide, we discuss choosing containers, selecting the right soil and plants, dealing with sunlight limitations, and vertical gardening tricks. Whether you are planting herbs or flowers, your balcony can be transformed into a lush oasis.', 4, 'balcony,urban,gardening', 'uploads/blogs/blog_1754413743_81a49179.png', 'Turn your balcony into a green retreat with our expert gardening tips.', 'published', '2025-08-05 16:47:01', '2025-08-05 17:09:03', '2025-08-04 11:15:00', 1),
(26, 'Herbal Plants That You Can Grow at Home', 'Growing herbs at home not only saves money but also ensures that you always have fresh ingredients on hand. From basil and mint to rosemary and thyme, we cover the easiest herbs to grow indoors or in your garden. This blog also includes recipes and ways to preserve your harvest.', 4, 'herbs,kitchen garden,plants', 'uploads/blogs/blog_1754413777_63b7e658.png', 'Top herbs to grow at home and how to use them in your cooking.', 'published', '2025-08-05 16:47:01', '2025-08-05 17:09:37', '2025-08-05 13:20:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `blog_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(27, 22, 1, 'I really enjoyed this blog. Indoor gardening has become my new hobby!', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(28, 22, 4, 'Great tips! I had no idea about the mental health benefits.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(29, 22, 5, 'I recently added a monstera to my living room—best decision ever.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(30, 23, 1, 'This is the kind of sustainability content we need!', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(31, 23, 4, 'Rainwater harvesting sounds interesting. Thanks for sharing.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(32, 23, 5, 'Eco-conscious gardening is the way to go. Excellent read.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(33, 24, 1, 'My tomato plant was suffering—turns out it was blight. This helped.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(34, 24, 4, 'Very informative. I now understand powdery mildew better.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(35, 24, 5, 'I’m bookmarking this for future reference. Thanks!', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(36, 25, 1, 'Balcony gardens are underrated. This guide is so helpful.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(37, 25, 4, 'Love the part about vertical gardening. Perfect for small spaces.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(38, 25, 5, 'Now I’m motivated to start my own mini garden.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(39, 26, 1, 'Herbal gardening is my passion! Great blog.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(40, 26, 4, 'I’ve grown mint and basil—looking to try rosemary next.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(41, 26, 5, 'Loved the recipe section with fresh herbs.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(42, 22, 1, 'I sent this to my sister—she just moved to an apartment.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(43, 23, 4, 'Permaculture is something I want to explore more.', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(44, 24, 5, 'Do you have a printable version of the disease checklist?', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(45, 25, 1, 'Can you recommend beginner plants for balconies?', '2025-08-05 16:52:56', '2025-08-05 16:52:56'),
(46, 26, 4, 'Would love a part 2 on herbal preservation methods.', '2025-08-05 16:52:56', '2025-08-05 16:52:56');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `session_id`, `created_at`, `updated_at`) VALUES
(12, NULL, 'gtqfjto1n4i3trja64u8u1sagu', '2025-07-29 15:17:13', '2025-07-29 15:17:13'),
(14, 1, NULL, '2025-08-01 09:35:39', '2025-08-01 09:35:39'),
(15, NULL, 'tqog4ghjla7djshavk45qi2ffp', '2025-08-04 07:23:15', '2025-08-04 07:23:15'),
(16, 4, 'g1k4f7m8tlt4l15v9ga35l51lc', '2025-08-05 17:46:42', '2025-08-05 17:46:42'),
(17, NULL, 'h8saqclds68mmp4d6ovce9qhvj', '2025-08-07 10:07:25', '2025-08-07 10:07:25'),
(18, NULL, 'jl2j9p8b3f8lqqf02cnc6n1u7r', '2025-08-16 16:12:07', '2025-08-16 16:12:07'),
(19, NULL, 'cshpvcho7ctb537vjaqhf7huod', '2025-08-17 14:04:50', '2025-08-17 14:04:50');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `product_type` enum('plant','tool','pesticide','fertilizer','accessory','all') NOT NULL DEFAULT 'all',
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `parent_id`, `product_type`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Medicinal Plants', 'medicinal-plants', 'Plants known for healing and health benefits.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(2, 'Aromatic Herbs', 'aromatic-herbs', 'Fragrant herbs used in aromatherapy and cooking.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(3, 'Indoor Foliage', 'indoor-foliage', 'Air-purifying indoor foliage.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(4, 'Succulents', 'succulents', 'Water-storing, low-maintenance indoor plants.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(5, 'Cacti', 'cacti', 'Spiky desert plants for indoor/outdoor decor.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(6, 'Ornamental Plants', 'ornamental-plants', 'Visually attractive plants for gardens.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(7, 'Flowering Shrubs', 'flowering-shrubs', 'Bushes with colorful blooms.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(8, 'Climbers & Vines', 'climbers-vines', 'Plants that grow vertically with support.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(9, 'Fruit Plants', 'fruit-plants', 'Small fruit-bearing plants.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(10, 'Vegetable Plants', 'vegetable-plants', 'Plants cultivated for edible vegetables.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(11, 'Leafy Greens', 'leafy-greens', 'Nutritious leafy vegetables like kale, spinach.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(12, 'Culinary Herbs', 'culinary-herbs', 'Edible herbs for cooking.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(13, 'Flowering Trees', 'flowering-trees', 'Trees that bloom seasonally.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(14, 'Evergreen Trees', 'evergreen-trees', 'Trees that remain green year-round.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(15, 'Tropical Plants', 'tropical-plants', 'Lush and vibrant tropical plants.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(16, 'Carnivorous Plants', 'carnivorous-plants', 'Insect-eating plants like Venus flytrap.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(17, 'Aquatic Plants', 'aquatic-plants', 'Plants that grow in water bodies.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(18, 'Bonsai', 'bonsai', 'Miniature tree arrangements.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(19, 'Miniature Plants', 'miniature-plants', 'Tiny plants for desktops and terrariums.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(20, 'Drought Tolerant Plants', 'drought-tolerant-plants', 'Plants that survive with minimal water.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(21, 'Pollinator Plants', 'pollinator-plants', 'Attract bees and butterflies.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(22, 'Plant-Based Medicines', 'plant-medicines', 'Herbal and plant-derived medicinal products.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(23, 'Ayurvedic Products', 'ayurvedic-products', 'Traditional natural remedies and tonics.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(24, 'Organic Oils & Extracts', 'organic-oils-extracts', 'Essential oils and herbal extracts.', NULL, 'plant', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(25, 'Hand Tools', 'hand-tools', 'Basic hand tools like trowels and pruners.', NULL, 'tool', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(26, 'Power Tools', 'power-tools', 'Powered gardening tools like trimmers.', NULL, 'tool', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(27, 'Watering Equipment', 'watering-equipment', 'Hoses, cans, sprinklers, and drip kits.', NULL, 'tool', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(28, 'Planting Tools', 'planting-tools', 'Seeders, planters, and transplanting kits.', NULL, 'tool', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(29, 'Organic Fertilizers', 'organic-fertilizers', 'Natural, eco-friendly plant boosters.', NULL, 'fertilizer', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(30, 'Chemical Fertilizers', 'chemical-fertilizers', 'Nitrogen, phosphorus, potassium based.', NULL, 'fertilizer', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(31, 'Compost & Manure', 'compost-manure', 'Natural compost and animal-based manure.', NULL, 'fertilizer', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(32, 'Liquid Fertilizers', 'liquid-fertilizers', 'Easy-to-use liquid nutrients.', NULL, 'fertilizer', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(33, 'Organic Pesticides', 'organic-pesticides', 'Non-toxic solutions to control pests.', NULL, 'pesticide', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(34, 'Insecticides', 'insecticides', 'Chemical sprays targeting insects.', NULL, 'pesticide', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(35, 'Fungicides', 'fungicides', 'Solutions to prevent or kill fungal infections.', NULL, 'pesticide', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(36, 'Herbicides', 'herbicides', 'Weed control sprays and granules.', NULL, 'pesticide', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(37, 'Pots & Planters', 'pots-planters', 'Decorative and functional containers.', NULL, 'accessory', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(38, 'Plant Stands & Hangers', 'plant-stands-hangers', 'Elevated or hanging support accessories.', NULL, 'accessory', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(39, 'Grow Bags', 'grow-bags', 'Fabric and plastic grow bags for plants.', NULL, 'accessory', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(40, 'Garden Decor', 'garden-decor', 'Statues, lights, and garden ornaments.', NULL, 'accessory', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(41, 'Labels & Markers', 'labels-markers', 'Tags for labeling plants.', NULL, 'accessory', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02'),
(42, 'Seed Trays & Propagation Kits', 'seed-trays-propagation', 'Kits for growing from seeds or cuttings.', NULL, 'accessory', NULL, 1, '2025-05-31 17:00:02', '2025-05-31 17:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `session_id` varchar(36) NOT NULL,
  `sender_type` enum('user','admin') NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_messages`
--

INSERT INTO `chat_messages` (`id`, `session_id`, `sender_type`, `admin_id`, `message`, `is_read`, `created_at`) VALUES
(42, 'chat_6890a50d3b56e8.83089613', 'user', NULL, 'gu', 1, '2025-08-04 12:18:21'),
(43, 'chat_6890a50d3b56e8.83089613', 'admin', 1, 'vag eikhan theke', 0, '2025-08-04 12:18:37');

-- --------------------------------------------------------

--
-- Table structure for table `chat_sessions`
--

CREATE TABLE `chat_sessions` (
  `id` varchar(36) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `status` enum('active','closed') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chat_sessions`
--

INSERT INTO `chat_sessions` (`id`, `user_name`, `user_email`, `admin_id`, `status`, `created_at`, `updated_at`) VALUES
('chat_6890a50d3b56e8.83089613', 'Afnan', 'afnan@gmail.com', 1, 'closed', '2025-08-04 12:18:21', '2025-08-04 12:18:45');

-- --------------------------------------------------------

--
-- Table structure for table `comment_reactions`
--

CREATE TABLE `comment_reactions` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reaction_type` enum('like','love','haha','wow','sad','angry') DEFAULT 'like',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment_reactions`
--

INSERT INTO `comment_reactions` (`id`, `comment_id`, `user_id`, `reaction_type`, `created_at`) VALUES
(5, 3, 4, 'like', '2025-08-16 19:35:27'),
(6, 2, 1, 'like', '2025-08-16 19:35:33'),
(8, 4, 1, 'like', '2025-08-16 19:36:19'),
(9, 4, 4, 'like', '2025-08-16 19:41:17'),
(11, 2, 4, 'like', '2025-08-16 20:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `consultant_availability`
--

CREATE TABLE `consultant_availability` (
  `id` int(11) NOT NULL,
  `consultant_id` int(11) NOT NULL,
  `days` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Array of available days (e.g., ["Monday", "Tuesday"])' CHECK (json_valid(`days`)),
  `time_slots` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Array of available time slots (e.g., [0, 1, 2] for 9-10, 10-11, 11-12)' CHECK (json_valid(`time_slots`)),
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consultant_availability`
--

INSERT INTO `consultant_availability` (`id`, `consultant_id`, `days`, `time_slots`, `notes`, `created_at`, `updated_at`) VALUES
(1, 4, '[\"Monday\",\"Tuesday\",\"Wednesday\",\"Thursday\",\"Saturday\",\"Sunday\"]', '[\"0\",\"1\",\"2\",\"6\"]', 'Friday closed', '2025-07-14 13:47:40', '2025-07-14 15:53:23');

-- --------------------------------------------------------

--
-- Table structure for table `consultant_fee`
--

CREATE TABLE `consultant_fee` (
  `fee_id` int(11) NOT NULL,
  `consultant_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 10.00,
  `payment_status` enum('pending','paid') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consultant_fee`
--

INSERT INTO `consultant_fee` (`fee_id`, `consultant_id`, `appointment_id`, `amount`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 4, 6, 10.00, 'paid', '2025-08-16 18:52:04', '2025-08-16 18:54:46'),
(2, 4, 4, 10.00, 'paid', '2025-08-16 18:55:29', '2025-08-16 19:12:26');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `min_order_amount` decimal(10,2) DEFAULT 0.00,
  `max_discount_amount` decimal(10,2) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `used_count` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `discount_type`, `discount_value`, `min_order_amount`, `max_discount_amount`, `start_date`, `end_date`, `usage_limit`, `used_count`, `is_active`, `created_at`, `updated_at`) VALUES
(4, 'lg25', 'percentage', 25.00, 20.00, 200.00, '2025-08-01 00:00:00', '2025-10-27 00:00:00', 5, 0, 1, '2025-08-01 11:38:36', '2025-08-01 15:56:11');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usage`
--

CREATE TABLE `coupon_usage` (
  `id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exchange_interests`
--

CREATE TABLE `exchange_interests` (
  `id` int(11) NOT NULL,
  `exchange_id` int(11) NOT NULL,
  `interested_user_id` int(11) NOT NULL,
  `offer_type` enum('plant','money','both') NOT NULL,
  `offered_plant` varchar(100) DEFAULT NULL,
  `offered_amount` decimal(10,2) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exchange_interests`
--

INSERT INTO `exchange_interests` (`id`, `exchange_id`, `interested_user_id`, `offer_type`, `offered_plant`, `offered_amount`, `message`, `status`, `created_at`) VALUES
(20, 2, 1, 'plant', 'gu 2', NULL, 'dibo na', 'pending', '2025-08-07 13:42:16'),
(23, 6, 4, 'plant', 'aaaaa', NULL, 'aaaaa', 'pending', '2025-08-07 14:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `exchange_offers`
--

CREATE TABLE `exchange_offers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `plant_name` varchar(100) NOT NULL,
  `plant_type` varchar(50) NOT NULL,
  `plant_age` varchar(20) DEFAULT NULL,
  `plant_health` enum('excellent','good','average','poor') DEFAULT 'good',
  `images` varchar(255) DEFAULT NULL,
  `exchange_type` enum('with_money','without_money') NOT NULL,
  `expected_amount` decimal(10,2) DEFAULT NULL,
  `expected_plant` varchar(100) DEFAULT NULL,
  `location` varchar(100) NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `status` enum('pending','approved','rejected','completed') DEFAULT 'pending',
  `admin_id` int(11) DEFAULT NULL COMMENT 'Admin who approved/rejected',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exchange_offers`
--

INSERT INTO `exchange_offers` (`id`, `user_id`, `title`, `description`, `plant_name`, `plant_type`, `plant_age`, `plant_health`, `images`, `exchange_type`, `expected_amount`, `expected_plant`, `location`, `latitude`, `longitude`, `status`, `admin_id`, `created_at`, `updated_at`) VALUES
(2, 4, 'Offer Title 2', 'Description 2', 'Plant Name 2', 'Plant Type 2', '2 months', 'excellent', 'uploads/exchange/6894a8755a2f9_516828831_1916566945807119_4908807847642793025_n.jpg,uploads/exchanges/img_6894b16c4e1ad8.57237783.png,uploads/exchanges/img_6894b19941dba7.07594713.png', 'with_money', 23.00, 'Looking for (plant name) 2', 'Nadda, Baridhara, Dhaka, Dhaka Metropolitan, Dhaka District, Dhaka Division, 1229, Bangladesh', NULL, NULL, 'approved', 1, '2025-08-07 13:21:57', '2025-08-07 14:55:08'),
(6, 1, 'ddddddd', 'dddddddddd', 'Plant Name', 'Plant Type', '', 'excellent', 'uploads/exchange/6894bac128258_Shobder Bondhu.png,uploads/exchange/6894bac1284df_1730180594271-Photoroom.png', 'without_money', NULL, '', 'UIU', NULL, NULL, 'approved', 1, '2025-08-07 14:40:01', '2025-08-18 11:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `forum_posts`
--

CREATE TABLE `forum_posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `is_published` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `forum_posts`
--

INSERT INTO `forum_posts` (`id`, `user_id`, `title`, `content`, `image_path`, `is_published`, `created_at`, `updated_at`) VALUES
(2, 1, 'ulala', 'fuck jani na', 'uploads/posts/post_6894dd64a76af.jpg', 1, '2025-08-07 16:33:12', '2025-08-07 17:10:59'),
(3, 4, 'not in good mood', 'ddddd', '', 1, '2025-08-16 19:46:39', '2025-08-16 19:46:39');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `department` varchar(50) NOT NULL,
  `location` varchar(100) NOT NULL,
  `job_type` enum('Full-time','Part-time','Contract','Internship','Temporary') NOT NULL,
  `salary_range` varchar(50) DEFAULT NULL,
  `description` text NOT NULL,
  `requirements` text NOT NULL,
  `responsibilities` text NOT NULL,
  `benefits` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `posted_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deadline` date DEFAULT NULL,
  `views` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `department`, `location`, `job_type`, `salary_range`, `description`, `requirements`, `responsibilities`, `benefits`, `is_active`, `posted_at`, `deadline`, `views`) VALUES
(4, 'Senior Plant Consultant', 'Admin', 'Dhaka, Bangladesh', 'Full-time', 'BDT 60,000 – 80,000/month', '<p style=\"text-align: left;\">As a Senior Plant Consultant, you will provide expert guidance to our customers in selecting, maintaining, and nurturing plants suited to their environment. You will also mentor junior consultants and collaborate with the operations team to improve customer satisfaction.</p>', '<ul>\r\n<li data-start=\"726\" data-end=\"793\">Master&rsquo;s degree in Botany, Agriculture, or Environmental Science.</li>\r\n<li data-start=\"726\" data-end=\"793\">Minimum 5 years of experience in plant consultancy or horticulture.</li>\r\n<li data-start=\"872\" data-end=\"927\">Strong knowledge of indoor and outdoor plant species.</li>\r\n<li data-start=\"932\" data-end=\"985\">Excellent communication and problem-solving skills.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"1016\" data-end=\"1087\">Advise customers on plant care, soil conditions, and pest management.</li>\r\n<li data-start=\"1092\" data-end=\"1130\">Mentor and train junior consultants.</li>\r\n<li data-start=\"1135\" data-end=\"1189\">Conduct workshops/webinars on sustainable gardening.</li>\r\n<li data-start=\"1194\" data-end=\"1266\">Collaborate with product and research teams to expand plant offerings.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"1289\" data-end=\"1308\">Health insurance.</li>\r\n<li data-start=\"1313\" data-end=\"1351\">Professional development allowances.</li>\r\n<li data-start=\"1356\" data-end=\"1396\">Paid vacation and flexible work hours.</li>\r\n<li data-start=\"1401\" data-end=\"1447\">Employee discount on plants and accessories.</li>\r\n</ul>', 1, '2025-08-17 17:42:28', '2025-11-30', 9),
(5, 'Junior Plant Consultant', 'Admin', 'Dhaka, Bangladesh', 'Full-time', 'BDT 25,000 – 35,000/month', '<p>The Junior Plant Consultant will assist senior consultants in providing advice and services to customers regarding plant care and purchases. This role is ideal for plant enthusiasts looking to grow in their careers.</p>', '<ul>\r\n<li data-start=\"1804\" data-end=\"1865\">Bachelor&rsquo;s degree in Agriculture, Botany, or related field.</li>\r\n<li data-start=\"1870\" data-end=\"1954\">1&ndash;2 years of relevant experience (freshers with strong plant knowledge may apply).</li>\r\n<li data-start=\"1959\" data-end=\"2011\">Enthusiastic learner with customer service skills.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"2042\" data-end=\"2083\">Support customers with plant selection.</li>\r\n<li data-start=\"2088\" data-end=\"2120\">Provide basic plant care tips.</li>\r\n<li data-start=\"2125\" data-end=\"2158\">Assist in workshops and events.</li>\r\n<li data-start=\"2163\" data-end=\"2201\">Prepare care guides for the website.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"2224\" data-end=\"2249\">Paid training sessions.</li>\r\n<li data-start=\"2254\" data-end=\"2299\">Growth opportunities under senior guidance.</li>\r\n<li data-start=\"2304\" data-end=\"2325\">Employee discounts.</li>\r\n</ul>', 1, '2025-08-17 17:48:15', '2025-11-30', 2),
(6, 'IT Support Engineer', 'Admin', 'Dhaka, Bangladesh', 'Full-time', 'BDT 35,000 – 50,000/month', '<p>The IT Support Engineer will ensure smooth functioning of EcoVerse&rsquo;s digital platforms, maintain servers, troubleshoot issues, and assist in developing new features for the website.</p>', '<ul>\r\n<li data-start=\"2644\" data-end=\"2690\">Bachelor&rsquo;s degree in Computer Science or IT.</li>\r\n<li data-start=\"2695\" data-end=\"2750\">Knowledge of PHP, MySQL, and basic server management.</li>\r\n<li data-start=\"2755\" data-end=\"2822\">Strong problem-solving skills and ability to work under pressure.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"2853\" data-end=\"2903\">Monitor website uptime and fix technical issues.</li>\r\n<li data-start=\"2908\" data-end=\"2942\">Provide IT support to employees.</li>\r\n<li data-start=\"2947\" data-end=\"3002\">Collaborate with developers to enhance site features.</li>\r\n<li data-start=\"3007\" data-end=\"3042\">Ensure data security and backups.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"3065\" data-end=\"3091\">Remote work flexibility.</li>\r\n<li data-start=\"3096\" data-end=\"3118\">Performance bonuses.</li>\r\n<li data-start=\"3123\" data-end=\"3154\">Training on new technologies.</li>\r\n</ul>', 1, '2025-08-17 17:50:07', '2025-11-30', 1),
(7, 'Admin Executive', 'Admin', 'Dhaka, Bangladesh', 'Full-time', 'BDT 25,000 – 35,000/month', '<p>The Admin Executive will handle day-to-day administrative tasks, office management, and assist with HR operations to ensure organizational efficiency.</p>', '<ul>\r\n<li data-start=\"4971\" data-end=\"5035\">Bachelor&rsquo;s degree in Business Administration or related field.</li>\r\n<li data-start=\"5040\" data-end=\"5081\">1&ndash;3 years of experience in admin roles.</li>\r\n<li data-start=\"5086\" data-end=\"5133\">Good communication and organizational skills.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"5164\" data-end=\"5203\">Manage office supplies and resources.</li>\r\n<li data-start=\"5208\" data-end=\"5255\">Support recruitment and onboarding processes.</li>\r\n<li data-start=\"5260\" data-end=\"5303\">Coordinate meetings and maintain records.</li>\r\n<li data-start=\"5308\" data-end=\"5353\">Assist employees with administrative needs.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"5376\" data-end=\"5406\">Supportive work environment.</li>\r\n<li data-start=\"5411\" data-end=\"5430\">Festival bonuses.</li>\r\n<li data-start=\"5435\" data-end=\"5472\">Learning opportunities in HR/admin.</li>\r\n</ul>', 1, '2025-08-17 17:53:08', '2025-11-30', 0),
(8, 'Content Editor', 'Admin', 'Dhaka, Bangladesh', 'Part-time', 'BDT 20,000 – 30,000/month', '<p>The Content Editor will review, edit, and manage plant-related blogs, guides, and newsletters, ensuring high-quality and engaging content for Green Legacy&rsquo;s audience.</p>', '<ul>\r\n<li data-start=\"5767\" data-end=\"5828\">Bachelor&rsquo;s degree in English, Journalism, or related field.</li>\r\n<li data-start=\"5833\" data-end=\"5890\">Strong writing/editing skills with attention to detail.</li>\r\n<li data-start=\"5895\" data-end=\"5928\">Familiarity with SEO practices.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"5959\" data-end=\"5989\">Edit and publish blog posts.</li>\r\n<li data-start=\"5994\" data-end=\"6042\">Maintain content consistency across platforms.</li>\r\n<li data-start=\"6047\" data-end=\"6098\">Coordinate with the marketing team for campaigns.</li>\r\n<li data-start=\"6103\" data-end=\"6139\">Create engaging plant care guides.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"6162\" data-end=\"6187\">Flexible working hours.</li>\r\n<li data-start=\"6192\" data-end=\"6211\">Creative freedom.</li>\r\n<li data-start=\"6216\" data-end=\"6259\">Growth opportunities in content strategy.</li>\r\n</ul>', 1, '2025-08-17 17:54:55', '2025-11-30', 3),
(9, 'Customer Support Officer', 'Admin', 'Dhaka, Bangladesh', 'Full-time', 'BDT 22,000 – 28,000/month', '<p>The Customer Support Officer will handle inquiries, complaints, and service requests from EcoVerse&rsquo;s customers, ensuring satisfaction and loyalty.</p>', '<ul>\r\n<li data-start=\"7297\" data-end=\"7335\">Bachelor&rsquo;s degree in any discipline.</li>\r\n<li data-start=\"7340\" data-end=\"7396\">1&ndash;2 years of experience in customer service preferred.</li>\r\n<li data-start=\"7401\" data-end=\"7440\">Excellent communication and patience.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"7471\" data-end=\"7522\">Respond to customer queries via chat/email/calls.</li>\r\n<li data-start=\"7527\" data-end=\"7558\">Track and resolve complaints.</li>\r\n<li data-start=\"7563\" data-end=\"7608\">Maintain a record of customer interactions.</li>\r\n<li data-start=\"7613\" data-end=\"7663\">Collaborate with consultants for expert support.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"7686\" data-end=\"7718\">Employee recognition programs.</li>\r\n<li data-start=\"7723\" data-end=\"7742\">Festival bonuses.</li>\r\n<li data-start=\"7747\" data-end=\"7776\">Training for career growth.</li>\r\n</ul>', 1, '2025-08-17 17:56:57', '2025-11-30', 0),
(10, 'Finance Officer', 'Admin', 'Dhaka, Bangladesh', 'Full-time', 'BDT 40,000 – 55,000/month', '<p>The Finance Officer will oversee EcoVerse&rsquo;s financial operations, ensuring smooth transactions, proper accounting, and compliance with regulations.</p>', '<ul>\r\n<li data-start=\"3435\" data-end=\"3506\">Bachelor&rsquo;s degree in Finance, Accounting, or Business Administration.</li>\r\n<li data-start=\"3511\" data-end=\"3557\">2+ years of experience in corporate finance.</li>\r\n<li data-start=\"3562\" data-end=\"3603\">Strong analytical and numerical skills.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"3634\" data-end=\"3674\">Manage budgets and financial planning.</li>\r\n<li data-start=\"3679\" data-end=\"3709\">Track expenses and revenues.</li>\r\n<li data-start=\"3714\" data-end=\"3750\">Prepare monthly financial reports.</li>\r\n<li data-start=\"3755\" data-end=\"3802\">Ensure compliance with financial regulations.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"3825\" data-end=\"3852\">Yearly performance bonus.</li>\r\n<li data-start=\"3857\" data-end=\"3877\">Medical allowance.</li>\r\n<li data-start=\"3882\" data-end=\"3920\">Career growth in finance management.</li>\r\n</ul>', 1, '2025-08-17 17:59:04', '2025-11-30', 0),
(11, 'Marketing Executive', 'Admin', 'Dhaka, Bangladesh', 'Contract', 'BDT 30,000 – 45,000/month', '<p>The Marketing Executive will manage Green Legacy&rsquo;s campaigns, customer engagement, and brand visibility across digital and offline channels.</p>', '<ul>\r\n<li data-start=\"6533\" data-end=\"6578\">Bachelor&rsquo;s degree in Marketing or Business.</li>\r\n<li data-start=\"6583\" data-end=\"6628\">Strong knowledge of social media campaigns.</li>\r\n<li data-start=\"6633\" data-end=\"6675\">Creative mindset with analytical skills.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"6706\" data-end=\"6745\">Plan and execute marketing campaigns.</li>\r\n<li data-start=\"6750\" data-end=\"6793\">Manage EcoVerse&rsquo;s social media platforms.</li>\r\n<li data-start=\"6798\" data-end=\"6824\">Conduct market research.</li>\r\n<li data-start=\"6829\" data-end=\"6875\">Collaborate with sales and operations teams.</li>\r\n</ul>', '<ul>\r\n<li data-start=\"6898\" data-end=\"6930\">Commission on sales campaigns.</li>\r\n<li data-start=\"6935\" data-end=\"6969\">Travel opportunities for events.</li>\r\n<li data-start=\"6974\" data-end=\"7008\">Growth into brand manager roles.</li>\r\n</ul>', 1, '2025-08-17 18:36:37', '2025-11-30', 10);

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `applicant_name` varchar(100) NOT NULL,
  `applicant_email` varchar(100) NOT NULL,
  `applicant_phone` varchar(20) DEFAULT NULL,
  `cover_letter` text DEFAULT NULL,
  `resume_path` varchar(255) DEFAULT NULL,
  `status` enum('Submitted','Under Review','Interview','Rejected','Hired') DEFAULT 'Submitted',
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `job_id`, `applicant_name`, `applicant_email`, `applicant_phone`, `cover_letter`, `resume_path`, `status`, `applied_at`) VALUES
(1, 11, 'Afnan Shahriar', 'afnan.shahriar27@gmail.com', '01601701444', 'August 18, 2025\r\nGreen Legacy, Inc.\r\nDear Hiring Manager,\r\nWith proven success in executive leadership, I\'m writing to express my interest in the position of Chief Executive Officer for MarketSmashers, Inc. My expertise in increasing revenue and innovating in global markets is the right combination to drive success and motivation in your company. I admire your modern technologies and have a great interest in exploring other markets with MarketSmashers, Inc. to become a global leader in the field.\r\nAt AdManage, Inc, I led the organization through six years of continued revenue growth, a total of 16% since starting with the company. Overseeing major acquisitions with global partners, we increased our market share by 10%. This was all while reducing overall spending by 8% by streamlining processes, investing in innovative software and developing a new client outreach model. Our revenue was similar to yours at $16 million annually, and I think we have the opportunity to grow even further through global expansion and technology.\r\nI am extremely grateful for your consideration for this position. Beyond my proven success as a business leader, my passion is to inspire and motivate employees throughout the company by having a clear vision and providing teams with the tools they need to execute it. I\'d love to speak in more detail about the position and the needs of your company. You can reach me at the email address or phone number listed above.\r\nThank you for your time and consideration.\r\nBest,\r\nAfnan Shahriar', 'uploads/resumes/resume_1755457342_bfacc618.pdf', 'Submitted', '2025-08-17 19:02:22'),
(2, 11, 'Mst. Sumaiya Akter', 'mail.afnan2710@gmail.com', '01861666884', '', 'uploads/resumes/resume_1755458469_891f24f7.pdf', 'Submitted', '2025-08-17 19:21:09');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subscribed_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `newsletter_subscribers`
--

INSERT INTO `newsletter_subscribers` (`id`, `email`, `subscribed_at`, `active`) VALUES
(4, 'afnan.shahriar27@gmail.com', '2025-08-05 19:01:13', 1),
(5, 'mail.afnan2710@gmail.com', '2025-08-05 19:05:07', 1),
(6, 'shahriar.afnan07@gmail.com', '2025-08-05 19:06:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `notice_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `admin_id` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `published_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`notice_id`, `title`, `content`, `admin_id`, `is_published`, `created_at`, `updated_at`, `published_at`) VALUES
(3, 'Annual Tree Planting Day - Join Us!', 'Green Legacy is organizing our annual tree planting event on March 12th at Central Park. Volunteers will receive free saplings and planting tools. Register by March 5th to secure your spot!', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-02-15 04:00:00'),
(4, 'Urban Gardening Workshop Series', 'Learn sustainable urban gardening techniques in our 4-week workshop starting April 1st. Topics include container gardening, composting, and water conservation. Limited seats available!', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-03-01 03:30:00'),
(5, 'Call for Environmental Research Papers', 'Green Legacy invites submissions for our annual Environmental Research Symposium. Deadline: May 30th. Selected papers will be published in our quarterly journal.', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-03-10 05:00:00'),
(6, 'Community Cleanup Drive - Riverside Area', 'Join us on April 22nd (Earth Day) for a massive cleanup of the Riverside area. Gloves and trash bags will be provided. Meet at 8 AM at the Riverside Park entrance.', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-03-20 08:00:00'),
(7, 'Solar Energy Seminar for Homeowners', 'Discover how to transition to solar energy at our free seminar on May 15th. Experts will discuss costs, benefits, and government incentives. RSVP required.', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-04-05 04:30:00'),
(8, 'Native Plant Sale - This Weekend Only!', 'Special sale on native plants and flowers at our nursery this weekend (June 3-4). All proceeds support our conservation programs. Early birds get 10% discount!', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-05-25 02:00:00'),
(9, 'Youth Environmental Leadership Program', 'Applications open for our summer leadership program (ages 14-18). 6-week intensive training on environmental activism and sustainability. Apply by June 15th.', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-05-10 07:15:00'),
(10, 'Volunteer Orientation Session', 'New volunteer orientation on July 8th at 10 AM. Learn about our various programs and how you can contribute. Light refreshments will be served.', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-06-20 10:00:00'),
(11, 'Sustainable Living Fair - Save the Date', 'Mark your calendars for September 9-10! Our annual fair features eco-friendly products, workshops, and keynote speakers. Vendor applications now open.', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-07-01 03:00:00'),
(12, 'Rainwater Harvesting Demonstration', 'Practical demonstration on setting up home rainwater harvesting systems. July 22nd at 2 PM. Free for members, $5 for non-members.', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-06-30 05:45:00'),
(13, 'Annual Report & Achievements Presentation', 'Join us August 5th as we present our annual environmental impact report and celebrate this year\'s achievements. Open to all supporters and donors.', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-07-20 04:00:00'),
(14, 'Fall Native Tree Planting Initiative', 'Help us plant 5,000 native trees this fall! Volunteer opportunities available every Saturday in October. No experience needed - training provided.', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-08-15 08:30:00'),
(15, 'Climate Change Panel Discussion', 'Renowned experts discuss local climate impacts and solutions. November 12th at the Community Center. Q&A session to follow.', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-09-10 06:00:00'),
(16, 'Holiday Eco-Market', 'Sustainable holiday shopping event on December 2-3. Featuring local artisans creating eco-friendly gifts and decorations.', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-10-20 03:00:00'),
(17, 'Winter Birdhouse Building Workshop', 'Learn to build eco-friendly birdhouses from recycled materials. December 10th at 1 PM. Perfect family activity! All materials provided.', 1, 1, '2025-08-09 16:48:31', '2025-08-09 16:48:31', '2023-11-15 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `type` enum('comment','reply','reaction_post','reaction_comment','mention') NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `reaction_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `recipient_id`, `sender_id`, `type`, `post_id`, `comment_id`, `reaction_id`, `is_read`, `created_at`) VALUES
(1, 1, 4, 'comment', 2, NULL, NULL, 1, '2025-08-16 19:59:19'),
(2, 1, 4, 'reply', 2, NULL, NULL, 0, '2025-08-16 20:02:35'),
(3, 1, 4, 'reaction_post', 2, NULL, NULL, 0, '2025-08-16 20:02:35'),
(4, 4, 1, 'comment', 3, NULL, NULL, 0, '2025-08-16 20:03:19'),
(5, 4, 1, 'reaction_post', 3, NULL, NULL, 0, '2025-08-16 20:03:19'),
(6, 1, 4, 'reply', 3, NULL, NULL, 0, '2025-08-16 20:04:22');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `order_number` varchar(50) DEFAULT NULL,
  `status` enum('pending','processing','completed','cancelled') DEFAULT 'pending',
  `total_amount` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT 0.00,
  `shipping_fee` decimal(10,2) DEFAULT 2.00,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `billing_address` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `session_id`, `order_number`, `status`, `total_amount`, `discount_amount`, `shipping_fee`, `subtotal`, `payment_method`, `coupon_id`, `shipping_address`, `billing_address`, `notes`, `created_at`, `updated_at`) VALUES
(6, 1, '6tj5rf3bf75e4cqv3kh2r3a8l5', 'ORD-68729596D823C', 'completed', 32.00, 0.00, 2.00, 30.00, '0', NULL, 'Ka-120/2, Kazi Amjad Garden, Kazibari Rd, Kuril, Dhaka', '', '', '2025-07-12 17:04:22', '2025-07-14 05:44:22'),
(7, 1, '6tj5rf3bf75e4cqv3kh2r3a8l5', 'ORD-6872A19033DBC', 'processing', 7.00, 0.00, 2.00, 5.00, '0', NULL, 'Ka-120/2, Kazi Amjad Garden, Kazibari Rd, Kuril, Dhaka', '', '', '2025-07-12 17:55:28', '2025-07-14 05:47:52'),
(11, 4, 'i1cul2dhlcvoekkgm86tq8es7c', 'ORD-6874B320C5CBB', 'completed', 2742.00, 0.00, 2.00, 2740.00, '0', NULL, 'Sayeednagar, Vatara, Dhaka', '', '', '2025-07-14 07:34:56', '2025-07-14 07:38:20'),
(12, 1, '0ut5romoo6a9rfh8hhdcs5mm4t', 'ORD-6878E5478D979', 'completed', 1252.00, 0.00, 2.00, 1250.00, '0', NULL, 'Ka-120/2, Kazi Amjad Garden, Kazibari Rd, Kuril, Dhaka', '', '', '2025-07-17 11:57:59', '2025-08-01 10:57:36'),
(13, 1, 'g1k4f7m8tlt4l15v9ga35l51lc', 'ORD-689205DD34E93', 'pending', 912.00, 0.00, 2.00, 910.00, '0', NULL, 'Ka-120/2, Kazi Amjad Garden, Kazibari Rd, Kuril, Dhaka', '', '', '2025-08-05 13:23:41', '2025-08-05 13:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `discount_price`) VALUES
(12, 6, 12, 2, 15.00, 11.00),
(13, 6, 13, 1, 5.00, NULL),
(14, 6, 14, 2, 2.00, 1.50),
(15, 7, 13, 1, 5.00, NULL),
(25, 11, 28, 1, 600.00, 540.00),
(26, 11, 37, 1, 2200.00, NULL),
(27, 12, 46, 1, 1250.00, NULL),
(28, 13, 19, 1, 300.00, 260.00),
(29, 13, 20, 1, 550.00, NULL),
(30, 13, 16, 1, 120.00, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plant_diseases`
--

CREATE TABLE `plant_diseases` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `symptoms` text NOT NULL,
  `prevention` text NOT NULL,
  `treatment` text NOT NULL,
  `climate_zones` varchar(255) NOT NULL COMMENT 'comma-separated',
  `seasons` varchar(255) NOT NULL COMMENT 'comma-separated',
  `plant_types` varchar(255) NOT NULL COMMENT 'comma-separated product_type values',
  `risk_level` enum('low','medium','high') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image_path` varchar(255) DEFAULT NULL COMMENT 'path to disease image'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plant_diseases`
--

INSERT INTO `plant_diseases` (`id`, `name`, `description`, `symptoms`, `prevention`, `treatment`, `climate_zones`, `seasons`, `plant_types`, `risk_level`, `created_at`, `updated_at`, `image_path`) VALUES
(1, 'Powdery Mildew', 'Fungal disease that appears as white powdery spots on leaves and stems', 'White powdery spots, distorted leaves, premature leaf drop', 'Ensure good air circulation, avoid overhead watering, plant resistant varieties', 'Apply fungicides containing sulfur or potassium bicarbonate, remove infected parts', 'temperate,subtropical', 'summer,autumn', 'plant', 'medium', '2025-08-04 10:07:55', '2025-08-04 10:07:55', NULL),
(2, 'Root Rot', 'Caused by overwatering and poor drainage, leading to fungal growth', 'Yellowing leaves, wilting, black/brown mushy roots', 'Use well-draining soil, avoid overwatering, ensure proper pot drainage', 'Remove affected parts, repot in fresh soil, apply fungicide', 'all', 'rainy', 'plant', 'high', '2025-08-04 10:07:55', '2025-08-04 10:07:55', NULL),
(3, 'Aphid Infestation', 'Small sap-sucking insects that cluster on new growth', 'Sticky residue (honeydew), curled leaves, stunted growth', 'Encourage beneficial insects like ladybugs, use reflective mulches', 'Spray with insecticidal soap or neem oil, use strong water spray', 'tropical,subtropical,temperate', 'spring,summer', 'plant', 'low', '2025-08-04 10:07:55', '2025-08-04 10:48:10', 'uploads/diseases/disease_1754303187_92dbb51a.jpg'),
(4, 'Late Blight', 'Serious fungal disease affecting tomatoes and potatoes', 'Dark water-soaked spots on leaves, white fungal growth underside', 'Rotate crops, avoid overhead watering, space plants properly', 'Remove and destroy infected plants, apply copper-based fungicides', 'temperate', 'summer,rainy', 'plant', 'high', '2025-08-04 10:07:55', '2025-08-04 10:07:55', NULL),
(5, 'Spider Mites', 'Tiny arachnids that cause stippling on leaves', 'Yellow stippling on leaves, fine webbing, leaf drop', 'Maintain humidity, regularly spray plants with water', 'Use miticides or insecticidal soaps, introduce predatory mites', 'arid,subtropical', 'summer', 'plant', 'medium', '2025-08-04 10:07:55', '2025-08-04 10:07:55', NULL),
(55, 'Leaf Spot', 'Fungal disease causing circular spots on leaves', 'Brown/black spots, yellow halos, leaf drop', 'Improve air circulation, avoid overhead watering', 'Remove affected leaves, apply fungicide', 'subtropical,arid', 'spring,summer', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 10:57:52', NULL),
(56, 'Powdery Mildew', 'White powdery fungal growth on leaves', 'White powder coating, distorted leaves', 'Plant resistant varieties, proper spacing', 'Apply sulfur or potassium bicarbonate', 'tropical,arid', 'winter,summer', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(57, 'Downy Mildew', 'Yellow angular spots on upper leaf surfaces', 'Yellow spots, white fluffy growth underneath', 'Water in morning, improve drainage', 'Apply copper-based fungicides', 'temperate,subtropical', 'rainy,spring', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(58, 'Rust', 'Orange/yellow pustules on leaf undersides', 'Rust-colored spots, premature leaf drop', 'Remove infected plants, avoid crowding', 'Apply fungicides early in infection', 'subtropical,arid', 'winter,summer', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(59, 'Black Spot', 'Circular black spots with fringed margins', 'Black spots, yellowing leaves', 'Water at base, remove fallen leaves', 'Prune infected areas, apply fungicide', 'subtropical,temperate', 'rainy,winter', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(60, 'Blight', 'Rapid wilting and browning of plant tissue', 'Brown lesions, white fungal growth', 'Rotate crops, avoid overhead watering', 'Remove infected plants, apply fungicide', 'arid,subtropical', 'summer,rainy', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(61, 'Wilt Disease', 'Blockage of water-conducting vessels', 'Wilting, yellowing, stunted growth', 'Use disease-free seeds, rotate crops', 'Remove infected plants, solarize soil', 'arid,subtropical', 'winter,spring', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(62, 'Root Rot', 'Decay of root system causing plant collapse', 'Yellow leaves, stunted growth, soft roots', 'Improve drainage, avoid overwatering', 'Remove affected plants, apply fungicide', 'subtropical,temperate', 'winter,spring', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(63, 'Anthracnose', 'Sunken lesions with dark margins on fruits/stems', 'Dark lesions, fruit rot, leaf blight', 'Prune for air flow, clean tools', 'Apply copper fungicides early', 'tropical,temperate', 'summer,spring', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(64, 'Canker', 'Sunken dead areas on stems/branches', 'Oozing lesions, dieback, bark cracks', 'Prune infected branches, avoid wounds', 'Remove infected parts, apply fungicide', 'subtropical,temperate', 'summer,spring', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(65, 'Mosaic Virus', 'Mottled light/dark green leaf patterns', 'Distorted growth, yellow mottling', 'Control aphids, disinfect tools', 'Remove infected plants, no cure', 'tropical,subtropical', 'summer,spring', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(66, 'Yellow Leaf Curl Virus', 'Upward curling of leaves with yellowing', 'Leaf curl, stunted growth', 'Control whiteflies, remove weeds', 'Remove infected plants immediately', 'arid,tropical', 'winter,summer', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(67, 'Bacterial Wilt', 'Sudden wilting without yellowing', 'Rapid collapse, sticky ooze from stems', 'Rotate crops, control cucumber beetles', 'Remove plants, solarize soil', 'subtropical,temperate', 'spring,rainy', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(68, 'Bacterial Blight', 'Water-soaked spots that turn brown', 'Angular leaf spots, stem lesions', 'Avoid overhead irrigation', 'Copper sprays may help', 'subtropical,temperate', 'rainy,summer', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(69, 'Fusarium Wilt', 'Yellowing and wilting starting on one side', 'Yellow leaves, brown vascular tissue', 'Plant resistant varieties, rotate crops', 'Remove infected plants, solarize soil', 'subtropical,arid', 'spring,winter', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(70, 'Verticillium Wilt', 'Yellowing between leaf veins progressing upward', 'V-shaped yellowing, brown streaks in stems', 'Plant resistant varieties, rotate crops', 'Remove infected plants, solarize soil', 'temperate,arid', 'rainy,spring', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(71, 'Clubroot', 'Swollen, distorted roots inhibiting growth', 'Stunted growth, yellowing, wilting', 'Raise soil pH, rotate crops', 'Remove infected plants, lime soil', 'temperate,subtropical', 'spring,winter', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(72, 'Late Blight', 'Water-soaked spots that rapidly enlarge', 'Dark lesions with white fungal growth', 'Space plants, avoid wet foliage', 'Apply fungicides preventatively', 'tropical,temperate', 'rainy,winter', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(73, 'Early Blight', 'Concentric rings on leaves resembling targets', 'Brown spots with yellow halos', 'Mulch plants, rotate crops', 'Apply fungicides early', 'tropical,arid', 'spring,winter', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(74, 'Sooty Mold', 'Black fungal growth on honeydew deposits', 'Black coating on leaves/stems', 'Control sap-sucking insects', 'Wash with mild soap solution', 'arid,tropical', 'spring,summer', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(75, 'Scab', 'Corky lesions on fruits and leaves', 'Olive-green spots turning brown', 'Plant resistant varieties', 'Apply fungicides during wet periods', 'arid,subtropical', 'summer,rainy', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(76, 'Leaf Curl', 'Thickened, curled, distorted leaves', 'Reddish or yellow discoloration', 'Plant resistant varieties', 'Apply fungicide before bud swell', 'arid,tropical', 'summer,rainy', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(77, 'Gray Mold (Botrytis)', 'Gray fuzzy fungal growth on dying tissue', 'Brown spots with gray spores', 'Improve air circulation', 'Remove infected parts, apply fungicide', 'arid,subtropical', 'winter,summer', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(78, 'Damping-Off', 'Seedlings collapse at soil line', 'Water-soaked stems, mold growth', 'Use sterile soil, avoid overwatering', 'No cure - remove affected seedlings', 'temperate,arid', 'summer,spring', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(79, 'Nematode Infestation', 'Root knots/galls impairing water uptake', 'Stunted growth, yellowing', 'Solarize soil, rotate crops', 'Apply organic amendments', 'arid,tropical', 'winter,spring', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(80, 'Crown Gall', 'Tumor-like growths at crown/roots', 'Round galls on stems/roots', 'Avoid wounding plants', 'Remove infected plants', 'arid,tropical', 'winter,rainy', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(81, 'Tobacco Mosaic Virus', 'Mottled light/dark green leaf patterns', 'Leaf distortion, stunted growth', 'Disinfect tools, control pests', 'No cure - remove infected plants', 'arid,subtropical', 'spring,summer', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(82, 'Tomato Spotted Wilt Virus', 'Bronze ringspots on leaves/fruit', 'Stunted growth, leaf necrosis', 'Control thrips, remove weeds', 'Remove infected plants', 'arid,subtropical', 'rainy,summer', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(83, 'Alternaria Leaf Spot', 'Concentric rings with yellow halos', 'Dark brown spots with target pattern', 'Avoid overhead watering', 'Apply fungicides early', 'tropical,temperate', 'winter,spring', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(84, 'Phytophthora Root Rot', 'Dark, water-soaked roots that decay', 'Wilting, yellowing, plant collapse', 'Improve drainage, avoid overwatering', 'Apply fungicides preventatively', 'tropical,arid', 'summer,spring', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(85, 'Pythium Root Rot', 'Brown, mushy roots with outer sheath slipping off', 'Damping-off, stunted growth', 'Use sterile media, avoid overwatering', 'Apply fungicides to soil', 'arid,temperate', 'winter,rainy', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(86, 'Septoria Leaf Spot', 'Small circular spots with dark margins', 'Yellow leaves with tiny black dots', 'Remove infected leaves, rotate crops', 'Apply copper-based fungicides', 'subtropical,arid', 'rainy,spring', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(87, 'Cercospora Leaf Spot', 'Small circular spots with gray centers', 'Purple/brown margins on spots', 'Space plants, remove debris', 'Apply fungicides preventatively', 'arid,temperate', 'rainy,winter', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(88, 'Bacterial Leaf Spot', 'Water-soaked spots that turn brown', 'Angular spots limited by veins', 'Avoid overhead watering', 'Copper sprays may help', 'subtropical,arid', 'rainy,winter', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(89, 'Stem Rot', 'Dark, water-soaked lesions on stems', 'Wilting, plant collapse', 'Avoid wounding stems', 'Remove infected plants', 'temperate,subtropical', 'rainy,spring', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(90, 'Sunscald', 'White or bleached areas on fruits/leaves', 'Papery patches, sunken areas', 'Provide shade during hottest hours', 'No cure - prevent with shading', 'tropical,arid', 'spring,rainy', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(91, 'Magnesium Deficiency', 'Interveinal chlorosis on older leaves', 'Yellow between green veins', 'Apply Epsom salts or dolomite lime', 'Foliar feed with magnesium sulfate', 'tropical,subtropical', 'winter,summer', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(92, 'Iron Chlorosis', 'Yellow leaves with green veins', 'Stunted growth in severe cases', 'Lower soil pH, apply chelated iron', 'Foliar iron applications', 'arid,subtropical', 'rainy,summer', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(93, 'Nutrient Burn', 'Leaf tip burn progressing inward', 'Brown crispy leaf margins', 'Flush soil, reduce fertilizer', 'Trim damaged leaves', 'temperate,subtropical', 'winter,summer', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(94, 'Tip Burn', 'Dieback of leaf tips and margins', 'Brown necrotic leaf edges', 'Maintain even moisture', 'Ensure proper calcium uptake', 'subtropical,temperate', 'rainy,spring', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(95, 'Edema', 'Blisters or bumps on leaf undersides', 'Corky outgrowths, may turn brown', 'Reduce humidity, improve air flow', 'Water less frequently', 'tropical,subtropical', 'winter,rainy', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(96, 'Leaf Browning', 'Brown leaf margins progressing inward', 'Crispy brown edges', 'Check watering, avoid salts', 'Flush soil if needed', 'arid,temperate', 'summer,rainy', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(97, 'Needle Blight', 'Brown needle tips progressing downward', 'Defoliation from bottom up', 'Improve air circulation', 'Apply fungicides if severe', 'subtropical,arid', 'rainy,summer', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(98, 'Needle Cast', 'Older needles turn brown and drop', 'Bands or spots on needles', 'Space plants, remove debris', 'Apply fungicides in spring', 'temperate,tropical', 'winter,rainy', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(99, 'Gummosis', 'Sap oozing from bark cracks', 'Sticky amber exudate on trunk', 'Avoid bark injuries', 'Improve tree vigor', 'tropical,arid', 'summer,spring', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(100, 'Shot Hole Disease', 'Holes in leaves where spots fell out', 'Small brown spots with halos', 'Prune for air flow', 'Apply copper fungicides', 'arid,tropical', 'summer,rainy', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(101, 'Pink Root', 'Pink to red discolored roots', 'Stunted growth, poor yield', 'Rotate crops, solarize soil', 'Plant resistant varieties', 'tropical,temperate', 'rainy,summer', 'plant', 'medium', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(102, 'White Mold', 'Fluffy white growth on stems/leaves', 'Water-soaked lesions, plant collapse', 'Space plants, remove debris', 'Apply fungicides early', 'arid,subtropical', 'rainy,winter', 'plant', 'high', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL),
(103, 'Black Knot', 'Black swollen growths on branches', 'Hard black galls on stems', 'Prune 6-8\" below galls', 'Disinfect tools between cuts', 'subtropical,tropical', 'spring,summer', 'plant', 'low', '2025-08-04 10:45:09', '2025-08-04 11:01:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `post_id`, `user_id`, `parent_id`, `content`, `created_at`, `updated_at`) VALUES
(2, 2, 1, NULL, 'hello', '2025-08-16 19:30:24', '2025-08-16 19:30:24'),
(3, 2, 1, 2, 'xxxx', '2025-08-16 19:31:07', '2025-08-16 19:31:07'),
(4, 2, 4, 2, 'I liked it', '2025-08-16 19:36:13', '2025-08-16 19:36:13'),
(6, 3, 1, NULL, 'pookie', '2025-08-16 19:47:48', '2025-08-16 19:47:48'),
(7, 2, 4, NULL, 'zzz', '2025-08-16 19:58:03', '2025-08-16 19:58:03'),
(8, 2, 4, NULL, 'xxxxxx', '2025-08-16 19:59:19', '2025-08-16 19:59:19'),
(9, 2, 4, 2, 'ssss', '2025-08-16 20:02:35', '2025-08-16 20:02:35'),
(10, 3, 1, NULL, 'zzzz', '2025-08-16 20:03:19', '2025-08-16 20:03:19'),
(11, 3, 4, 10, 'ddddd', '2025-08-16 20:04:22', '2025-08-16 20:04:22');

-- --------------------------------------------------------

--
-- Table structure for table `post_reactions`
--

CREATE TABLE `post_reactions` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reaction_type` enum('like','love','haha','wow','sad','angry') DEFAULT 'like',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_reactions`
--

INSERT INTO `post_reactions` (`id`, `post_id`, `user_id`, `reaction_type`, `created_at`) VALUES
(4, 2, 4, 'like', '2025-08-07 16:55:38'),
(11, 2, 1, 'like', '2025-08-16 19:21:56'),
(13, 3, 1, 'like', '2025-08-16 19:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `product_type` enum('plant','tool','pesticide','fertilizer','accessory') NOT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `average_rating` decimal(3,2) DEFAULT 0.00,
  `review_count` int(11) DEFAULT 0,
  `season` varchar(100) DEFAULT NULL,
  `climate_zone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `description`, `price`, `discount_price`, `sku`, `product_type`, `is_featured`, `is_active`, `created_at`, `updated_at`, `average_rating`, `review_count`, `season`, `climate_zone`) VALUES
(12, 1, 'Tulsi (Holy Basil)', 'tulsi-holy-basil-', 'A sacred medicinal plant known for its healing properties, used in herbal remedies and teas.', 15.00, 12.00, 'TULSI-001', 'plant', 1, 1, '2025-06-28 19:00:29', '2025-08-04 09:48:31', 0.00, 0, 'summer,rainy', 'tropical,subtropical'),
(13, 25, 'Garden Pruning Shears', 'garden-pruning-shears', 'Durable stainless steel pruning shears ideal for trimming small branches and stems.', 5.00, NULL, 'TOOL-PRUNE-001', 'tool', 1, 1, '2025-06-28 19:07:38', '2025-07-12 16:23:20', 0.00, 0, NULL, NULL),
(14, 29, 'Vermicompost', 'vermicompost', '100% organic fertilizer produced from earthworms. Enhances soil health and plant growth.', 2.00, NULL, 'FERTI-VERMI-001', 'fertilizer', 0, 1, '2025-06-28 19:14:16', '2025-07-13 13:25:50', 0.00, 0, NULL, NULL),
(15, 1, 'Neem Tree Seedling', 'neem-tree-seedling', 'Fast‑growing Azadirachta indica sapling.', 150.00, NULL, 'PLN-001', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer,rainy', 'tropical,subtropical'),
(16, 1, 'Aloe Vera Barbadensis', 'aloe-vera-barbadensis', 'Succulent famous for its soothing gel.', 120.00, 100.00, 'PLN-002', 'plant', 1, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 3.00, 2, 'summer', 'tropical,subtropical,arid'),
(17, 2, 'Peppermint Starter Pot', 'peppermint-starter-pot', 'Mentha × piperita—refreshing culinary herb.', 80.00, NULL, 'PLN-003', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'spring,summer', 'temperate,subtropical'),
(18, 2, 'Lemongrass Cluster', 'lemongrass-cluster', 'Cymbopogon citratus for teas & repellents.', 90.00, NULL, 'PLN-004', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer,rainy', 'tropical,subtropical'),
(19, 3, 'Snake Plant “Laurentii”', 'snake-plant-laurentii', 'Air‑purifying Sansevieria trifasciata.', 300.00, 260.00, 'PLN-005', 'plant', 1, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'all', 'all'),
(20, 3, 'Monstera Deliciosa', 'monstera-deliciosa-8in', '8‑inch split‑leaf monstera.', 550.00, NULL, 'PLN-006', 'plant', 1, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'all', 'tropical,subtropical'),
(21, 4, 'Echeveria “Lola”', 'echeveria-lola', 'Rosette‑forming pastel succulent.', 95.00, NULL, 'PLN-007', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'spring,summer', 'temperate,arid'),
(22, 4, 'Haworthia Zebra', 'haworthia-zebra', 'Striped Haworthia succulent, low maintenance.', 85.00, NULL, 'PLN-008', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'spring,summer', 'temperate,arid'),
(23, 5, 'Golden Barrel Cactus', 'golden-barrel-cactus', 'Iconic Echinocactus grusonii.', 200.00, NULL, 'PLN-009', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer', 'arid'),
(24, 5, 'Bunny Ear Cactus', 'bunny-ear-cactus', 'Opuntia microdasys with fuzzy pads.', 180.00, NULL, 'PLN-010', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer', 'arid'),
(25, 6, 'Croton Petra', 'croton-petra', 'Vibrant multi‑coloured foliage.', 320.00, NULL, 'PLN-011', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer,rainy', 'tropical,subtropical'),
(26, 7, 'Hibiscus Rosa‑sinensis', 'hibiscus-rosa-sinensis-red', 'Red tropical hibiscus shrub.', 250.00, NULL, 'PLN-012', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer', 'tropical,subtropical'),
(27, 8, 'Bougainvillea Pink', 'bougainvillea-pink', 'Hardy climber with papery bracts.', 280.00, NULL, 'PLN-013', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer', 'tropical,subtropical,arid'),
(28, 9, 'Blueberry Bush', 'blueberry-bush-1g', 'Vaccinium corymbosum, potted.', 600.00, 540.00, 'PLN-014', 'plant', 1, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'spring,summer', 'temperate'),
(29, 10, 'Cherry Tomato Starter', 'cherry-tomato-starter', 'Sweet 100 cultivar sapling.', 75.00, NULL, 'PLN-015', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer', 'temperate,subtropical'),
(30, 11, 'Kale Curly Seedling', 'kale-curly-seedling', 'Brassica oleracea acephala—nutrient dense.', 70.00, NULL, 'PLN-016', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'winter,spring', 'temperate'),
(31, 12, 'Rosemary Twig Pot', 'rosemary-twig-pot', 'Perennial aromatic herb.', 95.00, NULL, 'PLN-017', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'spring,summer,autumn', 'temperate,subtropical'),
(32, 13, 'Moringa oleifera Sapling', 'moringa-oleifera-sapling', 'Drumstick tree, fast‑growing & nutritious.', 260.00, NULL, 'PLN-018', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'rainy', 'tropical,subtropical'),
(33, 14, 'Thuja Orientalis', 'thuja-orientalis-2ft', 'Coniferous ornamental 2 ft.', 480.00, NULL, 'PLN-019', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'all', 'temperate'),
(34, 15, 'Bird of Paradise', 'bird-of-paradise-plant', 'Strelitzia reginae, dramatic foliage & flowers.', 950.00, 850.00, 'PLN-020', 'plant', 1, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer', 'tropical,subtropical'),
(35, 16, 'Venus Flytrap', 'venus-flytrap-dente', 'Dionaea muscipula “Dentate”.', 400.00, NULL, 'PLN-021', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer', 'temperate'),
(36, 17, 'Water Lily Pink', 'water-lily-pink', 'Live tuber, Nymphaea cultivar.', 370.00, NULL, 'PLN-022', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer', 'temperate'),
(37, 18, 'Ficus Retusa Bonsai 5yr', 'ficus-retusa-bonsai-5yr', 'Indoor 5‑year Ficus bonsai.', 2200.00, NULL, 'PLN-023', 'plant', 1, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'all', 'temperate'),
(38, 19, 'Mini Lucky Bamboo', 'mini-lucky-bamboo-spiral', 'Dracaena sanderiana spiral form.', 130.00, NULL, 'PLN-024', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'all', 'all'),
(39, 20, 'Jade Plant', 'jade-plant-large', 'Crassula ovata, forgiving succulent.', 260.00, NULL, 'PLN-025', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'all', 'all'),
(40, 21, 'Lavender “Munstead”', 'lavender-munstead', 'Bee‑friendly Lavandula angustifolia.', 210.00, NULL, 'PLN-026', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer', 'temperate,subtropical,arid'),
(41, 1, 'Gotu Kola', 'gotu-kola-pot', 'Centella asiatica, memory booster herb.', 110.00, NULL, 'PLN-027', 'plant', 0, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'rainy', 'tropical,subtropical'),
(42, 9, 'Dwarf Mango Alphonso', 'dwarf-mango-alphonso', 'Grafted Alphonso mango for pots.', 1500.00, NULL, 'PLN-028', 'plant', 1, 1, '2025-07-13 15:52:07', '2025-08-04 09:48:31', 0.00, 0, 'summer,rainy', 'tropical,subtropical'),
(43, 25, 'Garden Hand Trowel', 'garden-hand-trowel', 'Stainless‑steel, ergonomic handle.', 220.00, NULL, 'TOL-101', 'tool', 1, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(44, 25, 'Cultivator 3‑Prong', 'cultivator-3-prong', 'Loosens soil & removes weeds.', 180.00, NULL, 'TOL-102', 'tool', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(45, 28, 'Seed Dibber Set', 'seed-dibber-set', 'Wooden dibber + depth gauge.', 95.00, NULL, 'TOL-103', 'tool', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(46, 27, 'Expandable Garden Hose 50ft', 'expandable-garden-hose-50ft', 'Lightweight latex inner core, brass fittings.', 1250.00, NULL, 'TOL-104', 'tool', 1, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(47, 27, 'Metal Spray Nozzle 10‑Pattern', 'metal-spray-nozzle-10', 'Adjustable high‑pressure nozzle.', 360.00, NULL, 'TOL-105', 'tool', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(48, 26, 'Electric String Trimmer 300W', 'electric-string-trimmer-300w', 'Light‑duty lawn edging tool.', 3400.00, 2990.00, 'TOL-106', 'tool', 1, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(49, 26, 'Mini Cordless Tiller', 'mini-cordless-tiller', 'Rechargeable 20 V garden cultivator.', 6800.00, NULL, 'TOL-107', 'tool', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(50, 25, 'Soil pH Tester Analog', 'soil-ph-tester-analog', 'No batteries needed; quick readings.', 550.00, NULL, 'TOL-108', 'tool', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(51, 28, 'Transplanting Trowel', 'transplanting-trowel', 'Narrow head for seedlings.', 240.00, NULL, 'TOL-109', 'tool', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(52, 27, 'Drip Irrigation Starter Kit', 'drip-irrigation-starter', '20 m poly tubing + emitters.', 1950.00, NULL, 'TOL-110', 'tool', 1, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(53, 29, 'Bone Meal 2 kg', 'bone-meal-2kg', 'Slow‑release phosphorus & calcium.', 480.00, NULL, 'FER-201', 'fertilizer', 1, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(54, 29, 'Seaweed Granules 1 kg', 'seaweed-granules-1kg', 'Rich in micronutrients & growth hormones.', 420.00, NULL, 'FER-202', 'fertilizer', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(55, 30, 'NPK 20‑20‑20 Water‑Soluble 500 g', 'npk-20-20-20-500g', 'Balanced macro nutrients.', 390.00, NULL, 'FER-203', 'fertilizer', 1, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(56, 32, 'Fish Emulsion 500 ml', 'fish-emulsion-500ml', 'Organic nitrogen source, odor‑reduced.', 350.00, NULL, 'FER-204', 'fertilizer', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(57, 29, 'Neem Cake Powder 1 kg', 'neem-cake-powder-1kg', 'Acts as fertilizer & pest deterrent.', 320.00, NULL, 'FER-205', 'fertilizer', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(58, 31, 'Cow Manure 5 kg Sun‑dried', 'cow-manure-5kg', 'Heat‑treated, weed‑free.', 260.00, NULL, 'FER-206', 'fertilizer', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(59, 30, 'Urea Prilled 46%', 'urea-prilled-1kg', 'High‑nitrogen top dressing.', 240.00, NULL, 'FER-207', 'fertilizer', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(60, 31, 'Chicken Manure Pellets 3 kg', 'chicken-manure-pellets', 'Odor‑minimized slow‑release.', 430.00, NULL, 'FER-208', 'fertilizer', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(61, 32, 'Humic Acid Liquid 250 ml', 'humic-acid-liquid-250ml', 'Improves nutrient uptake & soil structure.', 310.00, NULL, 'FER-209', 'fertilizer', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(62, 29, 'Rock Phosphate Powder 1 kg', 'rock-phosphate-powder', 'Natural phosphorus source.', 290.00, NULL, 'FER-210', 'fertilizer', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(63, 33, 'Neem Oil Emulsifiable 300 ml', 'neem-oil-emulsifiable', 'Cold‑pressed neem oil 1500 ppm.', 380.00, NULL, 'PES-301', 'pesticide', 1, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(64, 34, 'Imidacloprid 17.8% SL 100 ml', 'imidacloprid-178sl-100ml', 'Systemic insecticide for sucking pests.', 420.00, NULL, 'PES-302', 'pesticide', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(65, 35, 'Copper Oxychloride WP 250 g', 'copper-oxychloride-250g', 'Broad‑spectrum contact fungicide.', 260.00, NULL, 'PES-303', 'pesticide', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(66, 36, 'Glyphosate 41% SL 500 ml', 'glyphosate-41sl-500ml', 'Non‑selective systemic herbicide.', 540.00, NULL, 'PES-304', 'pesticide', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(67, 35, 'Sulphur Dust Micronized 1 kg', 'sulphur-dust-1kg', 'Controls powdery mildew & mites.', 330.00, NULL, 'PES-305', 'pesticide', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(68, 34, 'Spinosad 2.5% SC 150 ml', 'spinosad-25sc-150ml', 'Organic‑certified thrip & caterpillar control.', 620.00, NULL, 'PES-306', 'pesticide', 1, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(69, 33, 'Garlic‑Chilli Spray Ready‑to‑Use 500 ml', 'garlic-chilli-spray', 'DIY‑style botanical repellent.', 290.00, NULL, 'PES-307', 'pesticide', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(70, 36, 'Pre‑Emergent Corn Gluten 1 kg', 'corn-gluten-preemergent', 'Natural weed suppressant granules.', 460.00, NULL, 'PES-308', 'pesticide', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(71, 34, 'Bacillus thuringiensis BT Powder 100 g', 'bt-powder-100g', 'Biological larvicide.', 180.00, NULL, 'PES-309', 'pesticide', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(72, 35, 'Mancozeb 75% WP 500 g', 'mancozeb-75wp-500g', 'Contact fungicide for late blight.', 320.00, NULL, 'PES-310', 'pesticide', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(73, 37, 'Ceramic Pot 6\" Marble Finish', 'ceramic-pot-6-marble', 'Gloss glazed, drainage hole.', 260.00, NULL, 'ACC-401', 'accessory', 1, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(74, 37, 'Terracotta Planter 10\"', 'terracotta-planter-10', 'Porous classic clay pot.', 220.00, NULL, 'ACC-402', 'accessory', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(75, 38, 'Macrame Hanger 2‑Tier', 'macrame-hanger-2-tier', 'Hand‑woven cotton rope.', 340.00, NULL, 'ACC-403', 'accessory', 1, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(76, 39, 'Fabric Grow Bag 15 L', 'fabric-grow-bag-15l', 'Breathable non‑woven bag with handles.', 180.00, NULL, 'ACC-404', 'accessory', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(77, 40, 'Solar Garden Fairy Lights 20 m', 'solar-garden-fairy-lights', 'Warm white LED string, dusk auto‑on.', 950.00, NULL, 'ACC-405', 'accessory', 1, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(78, 41, 'Reusable Slate Plant Labels Set 20', 'reusable-slate-plant-labels', 'Chalk‑write, weather‑proof.', 210.00, NULL, 'ACC-406', 'accessory', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(79, 42, 'Seed Tray 24‑Cell with Dome', 'seed-tray-24cell-dome', 'Includes humidity vent lid.', 280.00, NULL, 'ACC-407', 'accessory', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(80, 37, 'Self‑Watering Planter 8\"', 'self-watering-planter-8', 'Built‑in reservoir & wick.', 380.00, NULL, 'ACC-408', 'accessory', 1, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(81, 38, 'Metal Plant Stand 3‑Tier', 'metal-plant-stand-3tier', 'Powder‑coated, foldable.', 870.00, NULL, 'ACC-409', 'accessory', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(82, 39, 'Round Grow Bag 25 L', 'round-grow-bag-25l', 'UV‑treated HDPE, stitched.', 240.00, NULL, 'ACC-410', 'accessory', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(83, 40, 'Mini Resin Gnome Set of 4', 'mini-resin-gnome-set', 'Hand‑painted garden figurines.', 320.00, NULL, 'ACC-411', 'accessory', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL),
(84, 42, 'Coco Coir Pellet Refills 30', 'coco-coir-pellet-refills', 'Expanding discs for seed starting.', 190.00, NULL, 'ACC-412', 'accessory', 0, 1, '2025-07-13 15:52:07', '2025-07-13 15:52:07', 0.00, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_key` varchar(100) NOT NULL,
  `attribute_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `is_primary` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_path`, `is_primary`, `created_at`) VALUES
(3, 12, '68603bcd36180_Tulsi (Holy Basil).jpg', 1, '2025-06-28 19:00:29'),
(5, 13, '68603da92da47_Garden Pruning Shears.jpg', 1, '2025-06-28 19:08:25'),
(6, 13, '68603dbbc66c2_Garden Pruning Shears1.jpg', 0, '2025-06-28 19:08:43'),
(7, 14, '68603f080f2f6_Vermicompost.jpg', 1, '2025-06-28 19:14:16'),
(9, 15, '6873d8aae3cda_9deaa4e8-856e-4d75-a457-488e86054998.jpg', 0, '2025-07-13 16:02:50'),
(10, 15, '6873d8ca0a2b8_20eebf83-cf7b-4458-b38c-8aead2815fa6.jpg', 1, '2025-07-13 16:03:22'),
(11, 16, '6873d942170d6_3a61fbc7-eb58-43d7-84f0-11cc92a1ea01.jpg', 0, '2025-07-13 16:05:22'),
(12, 16, '6873d942176bb_b9d958dd-feae-4274-8729-439951bd5a44.jpg', 1, '2025-07-13 16:05:22'),
(13, 17, '6873da5ca6da0_630cbf1f-0ddd-4abe-9fc8-8d265910c77a.jpg', 0, '2025-07-13 16:10:04'),
(14, 17, '6873da5ca70fa_406fbcc0-cd26-4453-9264-a6e81a28ea52.jpg', 1, '2025-07-13 16:10:04'),
(15, 18, '6873dac44803a_b719d99a-82be-4783-aa58-9d261c498dbf.jpg', 0, '2025-07-13 16:11:48'),
(16, 18, '6873dac448311_d041740f-24b0-4c04-a396-370c664a77d8.jpg', 1, '2025-07-13 16:11:48'),
(17, 19, '6873db3ad1b61_b59b2cb2-4200-4e33-83e8-a7194f36cf68.jpg', 1, '2025-07-13 16:13:46'),
(18, 19, '6873db3ad21df_e8cf4dc8-6190-409f-ab53-8f9d0e43a792.jpg', 0, '2025-07-13 16:13:46'),
(19, 20, '6873db86d66c1_7d8d291a-3dec-49fb-87c7-a9a22642d85d.jpg', 1, '2025-07-13 16:15:02'),
(20, 20, '6873db86d6a8c_f649bac2-74f9-4baf-a001-df2374c421ba.jpg', 0, '2025-07-13 16:15:02'),
(21, 21, '6873dbcb81901_0a8689c9-3250-419f-bfdb-b008fd0c5e0a.jpg', 1, '2025-07-13 16:16:11'),
(22, 21, '6873dbcb827f2_1457837a-203b-4004-a156-e287c192912e.jpg', 0, '2025-07-13 16:16:11'),
(23, 22, '6873dc12c8ee8_54462f75-b9af-4147-ada1-d47f49eba1f6.jpg', 1, '2025-07-13 16:17:22'),
(24, 22, '6873dc12c9937_895c14c3-32ad-4921-ad07-beaed38a376d.jpg', 0, '2025-07-13 16:17:22'),
(25, 23, '6873dc702707d_3f96efc4-082b-4fd3-a72a-bf1c31e9d461.jpg', 1, '2025-07-13 16:18:56'),
(26, 23, '6873dc70279cc_ea26bca1-c978-4d2b-a75c-768f9b297e06.jpg', 0, '2025-07-13 16:18:56'),
(27, 24, '6873dce357f2f_de746dca-7bff-48a6-8ed5-62a03de28259.jpg', 1, '2025-07-13 16:20:51'),
(28, 24, '6873dce35823c_c175479b-d0a6-4a00-be4f-f65cb2edfc0c.jpg', 0, '2025-07-13 16:20:51'),
(29, 25, '6873dd21ea77b_60b60c8e-7c95-4223-8e78-e8d9ff033917.jpg', 1, '2025-07-13 16:21:53'),
(30, 25, '6873dd21eac7a_bdaddca6-82b0-49a7-85b2-848a0d9898a0.jpg', 0, '2025-07-13 16:21:53'),
(31, 26, '6873ddb590827_590217c6-d694-48db-9251-15ae5c3b0021.jpg', 1, '2025-07-13 16:24:21'),
(32, 26, '6873ddb591026_dbdd1a5f-a617-4ebb-9d53-74989258ed11.jpg', 0, '2025-07-13 16:24:21'),
(33, 27, '6873dde336049_aa913683-dde7-4632-b36b-80fe38e063c5.jpg', 1, '2025-07-13 16:25:07'),
(34, 27, '6873dde33640c_a9eace1e-a260-41e1-b45c-45184e27bb2f.jpg', 0, '2025-07-13 16:25:07'),
(35, 28, '6873e293cb632_18028ea5-00c9-4977-b453-073176255975.jpg', 1, '2025-07-13 16:45:07'),
(36, 28, '6873e293cc1ce_1913abab-0fb9-4efd-9da6-8760fb335ef4.jpg', 0, '2025-07-13 16:45:07'),
(37, 29, '6873e2d6cf056_f989d8c1-ee48-4987-b183-2f47f768bf02.jpg', 1, '2025-07-13 16:46:14'),
(38, 29, '6873e2d6cf41d_7c127927-c992-4c85-ab67-589034e3c873.jpg', 0, '2025-07-13 16:46:14'),
(39, 30, '6873e3113a1f0_c7ea3f04-0f40-406f-a3b6-b2d1507edf5e.jpg', 1, '2025-07-13 16:47:13'),
(40, 30, '6873e3113a65e_d77d43b8-657e-4c35-a484-a51a77f704ba.jpg', 0, '2025-07-13 16:47:13');

-- --------------------------------------------------------

--
-- Table structure for table `product_inventory`
--

CREATE TABLE `product_inventory` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `low_stock_threshold` int(11) DEFAULT 5,
  `is_in_stock` tinyint(1) DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_inventory`
--

INSERT INTO `product_inventory` (`id`, `product_id`, `quantity`, `low_stock_threshold`, `is_in_stock`, `updated_at`) VALUES
(2, 12, 24, 5, 1, '2025-07-13 15:24:51'),
(3, 13, 9, 5, 1, '2025-07-12 18:23:34'),
(4, 14, 15, 5, 1, '2025-07-13 13:25:50'),
(5, 15, 30, 5, 1, '2025-07-14 07:09:06'),
(6, 16, 29, 5, 1, '2025-08-05 13:23:41'),
(7, 17, 30, 5, 1, '2025-07-13 16:10:11'),
(8, 18, 30, 5, 1, '2025-07-13 16:11:59'),
(9, 19, 29, 5, 1, '2025-08-05 13:23:41'),
(10, 20, 29, 5, 1, '2025-08-05 13:23:41'),
(11, 21, 30, 5, 1, '2025-07-13 16:16:11'),
(12, 22, 30, 5, 1, '2025-07-13 16:17:22'),
(13, 23, 30, 5, 1, '2025-07-13 16:18:56'),
(14, 24, 30, 5, 1, '2025-07-13 16:20:51'),
(15, 25, 30, 5, 1, '2025-07-13 16:21:53'),
(16, 26, 30, 5, 1, '2025-07-13 16:24:21'),
(17, 27, 30, 5, 1, '2025-07-13 16:25:07'),
(18, 28, 29, 5, 1, '2025-07-14 07:34:56'),
(19, 29, 30, 5, 1, '2025-07-13 16:46:14'),
(20, 30, 30, 5, 1, '2025-07-13 16:47:13'),
(21, 31, 30, 5, 1, '2025-07-13 15:53:02'),
(22, 32, 30, 5, 1, '2025-07-13 15:53:02'),
(23, 33, 30, 5, 1, '2025-07-13 15:53:02'),
(24, 34, 30, 5, 1, '2025-07-13 15:53:02'),
(25, 35, 30, 5, 1, '2025-07-13 15:53:02'),
(26, 36, 30, 5, 1, '2025-07-13 15:53:02'),
(27, 37, 29, 5, 1, '2025-07-14 07:34:56'),
(28, 38, 30, 5, 1, '2025-07-13 15:53:02'),
(29, 39, 30, 5, 1, '2025-07-13 15:53:02'),
(30, 40, 30, 5, 1, '2025-07-13 15:53:02'),
(31, 41, 30, 5, 1, '2025-07-13 15:53:02'),
(32, 42, 30, 5, 1, '2025-07-13 15:53:02'),
(33, 43, 50, 5, 1, '2025-07-13 15:53:02'),
(34, 44, 50, 5, 1, '2025-07-13 15:53:02'),
(35, 45, 50, 5, 1, '2025-07-13 15:53:02'),
(36, 46, 49, 5, 1, '2025-07-17 11:57:59'),
(37, 47, 50, 5, 1, '2025-07-13 15:53:02'),
(38, 48, 50, 5, 1, '2025-07-13 15:53:02'),
(39, 49, 50, 5, 1, '2025-07-13 15:53:02'),
(40, 50, 50, 5, 1, '2025-07-13 15:53:02'),
(41, 51, 50, 5, 1, '2025-07-13 15:53:02'),
(42, 52, 50, 5, 1, '2025-07-13 15:53:02'),
(43, 53, 80, 5, 1, '2025-07-13 15:53:02'),
(44, 54, 80, 5, 1, '2025-07-13 15:53:02'),
(45, 55, 80, 5, 1, '2025-07-13 15:53:02'),
(46, 56, 80, 5, 1, '2025-07-13 15:53:02'),
(47, 57, 80, 5, 1, '2025-07-13 15:53:02'),
(48, 58, 80, 5, 1, '2025-07-13 15:53:02'),
(49, 59, 80, 5, 1, '2025-07-13 15:53:02'),
(50, 60, 80, 5, 1, '2025-07-13 15:53:02'),
(51, 61, 80, 5, 1, '2025-07-13 15:53:02'),
(52, 62, 80, 5, 1, '2025-07-13 15:53:02'),
(53, 63, 60, 5, 1, '2025-07-13 15:53:02'),
(54, 64, 60, 5, 1, '2025-07-13 15:53:02'),
(55, 65, 60, 5, 1, '2025-07-13 15:53:02'),
(56, 66, 60, 5, 1, '2025-07-13 15:53:02'),
(57, 67, 60, 5, 1, '2025-07-13 15:53:02'),
(58, 68, 60, 5, 1, '2025-07-13 15:53:02'),
(59, 69, 60, 5, 1, '2025-07-13 15:53:02'),
(60, 70, 60, 5, 1, '2025-07-13 15:53:02'),
(61, 71, 60, 5, 1, '2025-07-13 15:53:02'),
(62, 72, 60, 5, 1, '2025-07-13 15:53:02'),
(63, 73, 40, 5, 1, '2025-07-13 15:53:02'),
(64, 74, 40, 5, 1, '2025-07-13 15:53:02'),
(65, 75, 40, 5, 1, '2025-07-13 15:53:02'),
(66, 76, 40, 5, 1, '2025-07-13 15:53:02'),
(67, 77, 40, 5, 1, '2025-07-13 15:53:02'),
(68, 78, 40, 5, 1, '2025-07-13 15:53:02'),
(69, 79, 40, 5, 1, '2025-07-13 15:53:02'),
(70, 80, 40, 5, 1, '2025-07-13 15:53:02'),
(71, 81, 40, 5, 1, '2025-07-13 15:53:02'),
(72, 82, 40, 5, 1, '2025-07-13 15:53:02'),
(73, 83, 40, 5, 1, '2025-07-13 15:53:02'),
(74, 84, 40, 5, 1, '2025-07-13 15:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `title` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `is_approved` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `review_votes`
--

CREATE TABLE `review_votes` (
  `id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_helpful` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_posts`
--

CREATE TABLE `saved_posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `saved_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saved_posts`
--

INSERT INTO `saved_posts` (`id`, `user_id`, `post_id`, `saved_at`) VALUES
(3, 4, 2, '2025-08-07 16:57:30'),
(4, 1, 2, '2025-08-09 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `oauth_provider` varchar(20) DEFAULT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `location_updated_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `verification_token` varchar(255) DEFAULT NULL,
  `verification_token_expires` datetime DEFAULT NULL,
  `reward_point` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `dob`, `address`, `email`, `phone`, `password`, `oauth_provider`, `profile_pic`, `created_at`, `latitude`, `longitude`, `location_updated_at`, `is_verified`, `verification_token`, `verification_token_expires`, `reward_point`) VALUES
(1, 'Afnan', 'Shahriar', '2002-10-27', 'Ka-120/2, Kazi Amjad Garden, Kazibari Rd, Kuril, Dhaka', 'afnan.shahriar27@gmail.com', '+880160170144', '$2y$10$3Dt4m0TlceCpDY7.DjMKhu5RozEp23Uo9tZSj8CoMEWh.nx72O9Lu', NULL, 'uploads/profile_pics/user_1_1752414701.png', '2025-05-28 15:19:48', 23.82029007, 90.42174551, '2025-08-04 09:29:14', 1, NULL, NULL, 0),
(4, 'Mst. Sumaiya', 'Akter', '2001-01-14', 'Sayeednagar, Vatara, Dhaka', 'shahriar.afnan07@gmail.com', '+8801861666884', '$2y$10$9fr6inxjytz2RVopcwdNveDIT2aacBhUhgRtt92zlFlI5GR7x68B2', NULL, 'uploads/profiles/6873cd6ac1269.png', '2025-07-13 15:14:50', 23.82003300, 90.42174200, '2025-08-07 16:01:19', 1, NULL, NULL, 0),
(5, 'Sayma', 'Khusbu', '2000-10-24', 'Beraid, Natunbajar, Dhaka', 'mail.afnan2710@gmail.com', '+8801601701444', '$2y$10$csUHQzdwaxAXjWqVR559JuUFxAp1n24ZZ7IBZRKFjjmHaW.nX0Jzq', NULL, 'uploads/profiles/688e36180bb6f.jpg', '2025-08-02 16:00:24', NULL, NULL, NULL, 1, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_consultant_date` (`consultant_id`,`date`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_cart_product` (`cart_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `idx_chat_session` (`session_id`);

--
-- Indexes for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `comment_reactions`
--
ALTER TABLE `comment_reactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_comment` (`user_id`,`comment_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `consultant_availability`
--
ALTER TABLE `consultant_availability`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_consultant` (`consultant_id`);

--
-- Indexes for table `consultant_fee`
--
ALTER TABLE `consultant_fee`
  ADD PRIMARY KEY (`fee_id`),
  ADD KEY `consultant_id` (`consultant_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `coupon_usage`
--
ALTER TABLE `coupon_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `exchange_interests`
--
ALTER TABLE `exchange_interests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exchange_id` (`exchange_id`),
  ADD KEY `interested_user_id` (`interested_user_id`);

--
-- Indexes for table `exchange_offers`
--
ALTER TABLE `exchange_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_id` (`job_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`notice_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `reaction_id` (`reaction_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plant_diseases`
--
ALTER TABLE `plant_diseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `post_reactions`
--
ALTER TABLE `post_reactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_post` (`user_id`,`post_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_inventory`
--
ALTER TABLE `product_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `review_votes`
--
ALTER TABLE `review_votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_review` (`user_id`,`review_id`),
  ADD KEY `review_id` (`review_id`);

--
-- Indexes for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_post` (`user_id`,`post_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `comment_reactions`
--
ALTER TABLE `comment_reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `consultant_availability`
--
ALTER TABLE `consultant_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `consultant_fee`
--
ALTER TABLE `consultant_fee`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coupon_usage`
--
ALTER TABLE `coupon_usage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exchange_interests`
--
ALTER TABLE `exchange_interests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `exchange_offers`
--
ALTER TABLE `exchange_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `forum_posts`
--
ALTER TABLE `forum_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `plant_diseases`
--
ALTER TABLE `plant_diseases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post_reactions`
--
ALTER TABLE `post_reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `product_inventory`
--
ALTER TABLE `product_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review_votes`
--
ALTER TABLE `review_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saved_posts`
--
ALTER TABLE `saved_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`consultant_id`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `admins` (`admin_id`),
  ADD CONSTRAINT `blogs_ibfk_2` FOREIGN KEY (`approved_by`) REFERENCES `admins` (`admin_id`);

--
-- Constraints for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `chat_sessions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`) ON DELETE SET NULL;

--
-- Constraints for table `chat_sessions`
--
ALTER TABLE `chat_sessions`
  ADD CONSTRAINT `chat_sessions_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`) ON DELETE SET NULL;

--
-- Constraints for table `comment_reactions`
--
ALTER TABLE `comment_reactions`
  ADD CONSTRAINT `comment_reactions_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `post_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_reactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `consultant_availability`
--
ALTER TABLE `consultant_availability`
  ADD CONSTRAINT `consultant_availability_ibfk_1` FOREIGN KEY (`consultant_id`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE;

--
-- Constraints for table `consultant_fee`
--
ALTER TABLE `consultant_fee`
  ADD CONSTRAINT `consultant_fee_ibfk_1` FOREIGN KEY (`consultant_id`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consultant_fee_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_usage`
--
ALTER TABLE `coupon_usage`
  ADD CONSTRAINT `coupon_usage_ibfk_1` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `coupon_usage_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `coupon_usage_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `exchange_interests`
--
ALTER TABLE `exchange_interests`
  ADD CONSTRAINT `exchange_interests_ibfk_1` FOREIGN KEY (`exchange_id`) REFERENCES `exchange_offers` (`id`),
  ADD CONSTRAINT `exchange_interests_ibfk_2` FOREIGN KEY (`interested_user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `exchange_offers`
--
ALTER TABLE `exchange_offers`
  ADD CONSTRAINT `exchange_offers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `exchange_offers_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`);

--
-- Constraints for table `forum_posts`
--
ALTER TABLE `forum_posts`
  ADD CONSTRAINT `forum_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD CONSTRAINT `job_applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`admin_id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`post_id`) REFERENCES `forum_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_4` FOREIGN KEY (`comment_id`) REFERENCES `post_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_5` FOREIGN KEY (`reaction_id`) REFERENCES `post_reactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `forum_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_comments_ibfk_3` FOREIGN KEY (`parent_id`) REFERENCES `post_comments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_reactions`
--
ALTER TABLE `post_reactions`
  ADD CONSTRAINT `post_reactions_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `forum_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_reactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventory`
--
ALTER TABLE `product_inventory`
  ADD CONSTRAINT `product_inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `review_votes`
--
ALTER TABLE `review_votes`
  ADD CONSTRAINT `review_votes_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `review_votes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD CONSTRAINT `saved_posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_posts_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `forum_posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

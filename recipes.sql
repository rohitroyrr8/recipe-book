-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 04, 2019 at 10:33 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipe-box`
--

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `user_id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(2, 11, 'Non inventore itaque commodi eum.', 'Tenetur ducimus omnis ea voluptate quia ut. Adipisci rerum dolor eos error. Aut eligendi sit corporis. Ipsa voluptatem aliquam est suscipit. Cumque molestias aut sit consequatur. Voluptatibus voluptatum dolore eum eligendi consequuntur qui. Aut corporis consectetur in dicta quo excepturi consequatur dolor. Voluptatem architecto ab sit aspernatur incidunt et maxime. Mollitia consectetur sapiente sapiente est repellendus. Voluptas aut occaecati illum. Perspiciatis et sapiente quas itaque illo sed ad. Doloremque nesciunt dolorum laboriosam. Eum nobis aut doloribus nam. Fugiat quo aliquid laudantium consequatur. Voluptatum veritatis qui voluptas veniam aspernatur repudiandae vel. Rerum qui molestias ex corporis nihil aperiam deserunt. Id et est velit fugiat et. Eveniet earum eaque consequuntur sed ipsa dicta.', 'text.png', '2019-03-27 02:31:03', '2019-03-27 02:31:03'),
(3, 3, 'Aspernatur illum placeat iste et quae doloremque optio.', 'Harum voluptate ullam aut magni eligendi nulla laboriosam. Aliquid maxime sint ducimus vel voluptatem enim consequatur. Saepe aut hic repellat ut. Sed incidunt distinctio soluta optio est enim commodi. Eligendi est a debitis sit aperiam. Doloremque minima incidunt id sunt voluptate unde unde. Nobis ipsum nobis quas quod ex ullam. Esse minima maiores maiores quia corrupti rerum. Autem dolor cupiditate ratione quia. Et nihil minima pariatur et voluptas. Unde excepturi voluptatem excepturi optio. Autem non et officia ea. At a provident quis. Minima aliquam id et expedita consequuntur ullam voluptas earum.', 'text.png', '2019-03-27 02:31:05', '2019-03-27 02:31:05'),
(5, 5, 'Dolor et alias distinctio natus.', 'Saepe corporis accusantium in mollitia voluptatibus nostrum. Ut laboriosam perferendis recusandae pariatur harum eos aut. Soluta totam quis atque voluptatibus ad at. Est dignissimos blanditiis atque corrupti qui esse. Et vero eum dolores sint rerum recusandae. Perferendis dolore numquam quia inventore placeat sint. Laboriosam in a nobis dignissimos tempore rem. Reiciendis in iusto eos beatae.', 'text.png', '2019-03-27 02:31:08', '2019-03-27 02:31:08'),
(6, 6, 'Sint incidunt harum qui natus qui impedit.', 'Ducimus rerum molestias excepturi a earum. Eligendi perspiciatis consequatur aperiam distinctio voluptates repellendus. Nemo optio inventore et. Neque aut officiis voluptatem fugit est recusandae. Veritatis dicta distinctio reiciendis. Aut ut nihil totam ut. Perferendis sed ea sunt sint dolorem. Animi quod ipsa asperiores quis possimus. Nemo voluptas odit deleniti sit. Eligendi possimus dolorem eaque molestiae vero. Itaque maxime eos praesentium saepe maiores cum. Dolores odit recusandae et et cupiditate. Sit rerum beatae ullam quisquam. Fugiat voluptatem unde deleniti. Veniam sed sed sint labore perspiciatis suscipit. Fugit omnis sint laudantium. Reprehenderit eaque a vel excepturi. Aut praesentium animi id quas.', 'text.png', '2019-03-27 02:31:10', '2019-03-27 02:31:10'),
(7, 7, 'Et autem voluptas quae tempora esse ut nihil.', 'Et rerum ipsum fugiat inventore. Iusto sunt provident laborum id rem dolorem consectetur. Ipsam atque ratione molestiae rerum est sed voluptatem. Sed quas voluptas rerum quas voluptatem consequatur. Corporis quibusdam est repellat est. Velit tempora expedita ipsa tempora magni accusamus. Alias provident qui excepturi qui assumenda omnis. Tempora cum exercitationem iusto quis quia sed. Harum voluptatem quia quia at necessitatibus et rerum. Distinctio et eveniet et rerum voluptatem. Exercitationem assumenda quibusdam ipsa voluptatem ut consequatur. Consectetur dolor eius accusantium minus est accusantium at dolore. Et praesentium consequatur maiores ut iste rerum. Voluptatem laborum voluptatibus error earum aut quo. Blanditiis reprehenderit et quas necessitatibus mollitia veniam ad. Quos reprehenderit sed molestiae corrupti sed corrupti. Et iusto in accusantium qui consequuntur ea porro. Accusantium illo animi eius ut et. Excepturi ut non eum dignissimos. Deserunt aliquid voluptatem ducimus magni atque.', 'text.png', '2019-03-27 02:31:12', '2019-03-27 02:31:12'),
(8, 8, 'Libero voluptas magnam impedit vel.', 'Reiciendis qui esse accusantium modi id culpa dolor. Nostrum at non dolorum iure tempore et facilis. Vero dolorem voluptatem distinctio ratione suscipit inventore reprehenderit. Delectus non similique est commodi. Quasi eos nihil est exercitationem. Sapiente quaerat voluptate dolores fugit. Voluptas accusantium eos voluptatem aut non. Voluptate sed ut veritatis eveniet vel consectetur non. Dolores hic voluptas neque facere sunt. Est nostrum libero dolores sed qui. Incidunt quos alias et voluptatem nisi doloribus. Qui tempora deserunt totam ut. Aut officiis dolore eos aspernatur quaerat. Qui culpa accusamus quo ut. Unde sunt odio aliquid eveniet.', 'text.png', '2019-03-27 02:31:13', '2019-03-27 02:31:13'),
(9, 9, 'Error id illo dolores reiciendis tempora in.', 'Praesentium asperiores nesciunt debitis asperiores distinctio quasi. Eum nihil quasi velit qui. Qui sequi quasi unde ut qui. Nihil magni non nobis ex ullam cupiditate reiciendis. Libero et quae ut minima impedit. Adipisci sed voluptatem molestiae ab aliquam cumque repellat. Velit et aut est sunt maiores qui quaerat. Temporibus nam explicabo autem nobis. Placeat consequatur consequuntur laudantium. Ut at aut praesentium aut et. Dolorum id vel et aut. Dolor non voluptatem maiores voluptatibus.', 'text.png', '2019-03-27 02:31:15', '2019-03-27 02:31:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

<%--
  Created by IntelliJ IDEA.
  User: LE NHAT
  Date: 11/12/2025
  Time: 8:05 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  body {
    font-family: 'Arial', sans-serif;
    line-height: 1.6;
    color: #333;
    background: #f5f5f5;
  }

  /* Top Bar */
  .top-bar {
    background: #d70018;
    color: white;
    padding: 0.5rem 0;
    font-size: 0.85rem;
  }

  .top-bar-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .top-bar a {
    color: white;
    text-decoration: none;
    margin: 0 1rem;
  }

  /* Header */
  header {
    background: white;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    position: sticky;
    top: 0;
    z-index: 100;
  }

  .header-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 1rem 20px;
    display: grid;
    grid-template-columns: 200px 1fr auto;
    gap: 2rem;
    align-items: center;
  }

  .logo {
    font-size: 1.8rem;
    font-weight: bold;
    color: #d70018;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }

  .search-container {
    position: relative;
    max-width: 500px;
  }

  .search-box {
    display: flex;
    border: 2px solid #d70018;
    border-radius: 8px;
    overflow: hidden;
  }

  .search-box input {
    flex: 1;
    padding: 0.7rem 1rem;
    border: none;
    outline: none;
    font-size: 0.95rem;
  }

  .search-box button {
    padding: 0.7rem 1.5rem;
    background: #d70018;
    color: white;
    border: none;
    cursor: pointer;
    font-weight: bold;
  }

  .header-actions {
    display: flex;
    gap: 1.5rem;
    align-items: center;
  }

  .header-btn {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-decoration: none;
    color: #333;
    font-size: 0.85rem;
    transition: color 0.3s;
  }

  .header-btn:hover {
    color: #d70018;
  }

  .header-btn-icon {
    font-size: 1.5rem;
    margin-bottom: 0.2rem;
  }

  .cart-badge {
    background: #d70018;
    color: white;
    border-radius: 50%;
    padding: 0.1rem 0.4rem;
    font-size: 0.7rem;
    position: absolute;
    margin-left: 1rem;
    margin-top: -0.5rem;
  }

  /* Navigation */
  nav {
    background: white;
    border-top: 1px solid #eee;
    border-bottom: 1px solid #eee;
  }

  .nav-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: flex;
    gap: 0;
  }

  .nav-item {
    padding: 1rem 1.5rem;
    text-decoration: none;
    color: #333;
    font-weight: 500;
    border-bottom: 3px solid transparent;
    transition: all 0.3s;
    display: flex;
    align-items: center;
    gap: 0.5rem;
  }

  .nav-item:hover {
    color: #d70018;
    border-bottom-color: #d70018;
    background: #fff5f5;
  }

  /* Banner Slider */
  .banner-slider {
    max-width: 1200px;
    margin: 1.5rem auto;
    padding: 0 20px;
    position: relative;
    overflow: hidden;
    border-radius: 12px;
  }

  .banner-slide {
    background: linear-gradient(135deg, #d70018 0%, #ff4757 100%);
    height: 400px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    border-radius: 12px;
    position: relative;
    overflow: hidden;
  }

  .banner-content {
    text-align: center;
    z-index: 2;
  }

  .banner-content h1 {
    font-size: 3rem;
    margin-bottom: 1rem;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
  }

  .banner-content p {
    font-size: 1.5rem;
    margin-bottom: 1.5rem;
  }

  .banner-btn {
    background: white;
    color: #d70018;
    padding: 1rem 2.5rem;
    border: none;
    border-radius: 30px;
    font-size: 1.1rem;
    font-weight: bold;
    cursor: pointer;
    transition: transform 0.3s;
  }

  .banner-btn:hover {
    transform: scale(1.05);
  }

  /* Category Section */
  .category-section {
    max-width: 1200px;
    margin: 2rem auto;
    padding: 0 20px;
  }

  .category-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 1rem;
  }

  .category-card {
    background: white;
    padding: 1.5rem;
    text-align: center;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s;
    border: 2px solid transparent;
  }

  .category-card:hover {
    border-color: #d70018;
    transform: translateY(-5px);
    box-shadow: 0 5px 15px rgba(215, 0, 24, 0.2);
  }

  .category-icon {
    font-size: 3rem;
    margin-bottom: 0.5rem;
  }

  .category-name {
    font-weight: bold;
    color: #333;
  }

  /* Product Section */
  .product-section {
    max-width: 1200px;
    margin: 2rem auto;
    padding: 0 20px;
  }

  .section-header {
    background: white;
    padding: 1rem 1.5rem;
    border-radius: 8px 8px 0 0;
    border-left: 4px solid #d70018;
    margin-bottom: 1rem;
  }

  .section-title {
    font-size: 1.5rem;
    color: #d70018;
    font-weight: bold;
  }

  .product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
    gap: 1rem;
  }

  .product-card {
    background: white;
    border-radius: 8px;
    overflow: hidden;
    transition: all 0.3s;
    cursor: pointer;
    border: 1px solid #e0e0e0;
    position: relative;
  }

  .product-card:hover {
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    transform: translateY(-5px);
  }

  .product-badge {
    position: absolute;
    top: 10px;
    left: 10px;
    background: #d70018;
    color: white;
    padding: 0.3rem 0.7rem;
    border-radius: 4px;
    font-size: 0.75rem;
    font-weight: bold;
    z-index: 1;
  }

  .product-image-container {
    position: relative;
    padding: 1.5rem;
    background: #fafafa;
    height: 220px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .product-image {
    font-size: 4rem;
    filter: drop-shadow(2px 2px 4px rgba(0,0,0,0.1));
  }

  .product-info {
    padding: 1rem;
  }

  .product-name {
    font-size: 0.95rem;
    font-weight: 500;
    margin-bottom: 0.5rem;
    color: #333;
    height: 40px;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }

  .product-specs {
    font-size: 0.8rem;
    color: #666;
    margin-bottom: 0.5rem;
  }

  .product-price-container {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    margin-top: 0.5rem;
  }

  .product-price {
    font-size: 1.3rem;
    color: #d70018;
    font-weight: bold;
  }

  .product-old-price {
    text-decoration: line-through;
    color: #999;
    font-size: 0.9rem;
  }

  .product-discount {
    background: #fff3cd;
    color: #856404;
    padding: 0.2rem 0.5rem;
    border-radius: 4px;
    font-size: 0.75rem;
    font-weight: bold;
  }

  .product-promotion {
    background: #fff5f5;
    padding: 0.5rem;
    margin-top: 0.5rem;
    border-radius: 4px;
    font-size: 0.8rem;
    color: #d70018;
    border: 1px dashed #d70018;
  }

  .product-installment {
    font-size: 0.8rem;
    color: #666;
    margin-top: 0.3rem;
  }

  /* Footer */
  footer {
    background: #1a1a1a;
    color: #ccc;
    margin-top: 3rem;
    padding: 3rem 0 1rem;
  }

  .footer-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 2rem;
  }

  .footer-section h3 {
    color: white;
    margin-bottom: 1rem;
    font-size: 1.1rem;
  }

  .footer-section ul {
    list-style: none;
  }

  .footer-section ul li {
    margin-bottom: 0.7rem;
  }

  .footer-section a {
    color: #ccc;
    text-decoration: none;
    transition: color 0.3s;
    font-size: 0.9rem;
  }

  .footer-section a:hover {
    color: #d70018;
  }

  .footer-bottom {
    text-align: center;
    padding: 1.5rem 0;
    margin-top: 2rem;
    border-top: 1px solid #333;
    font-size: 0.85rem;
  }

  /* Navigation Helper */
  .nav-links {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background: white;
    padding: 1rem;
    border-radius: 10px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.15);
    z-index: 1000;
    border: 2px solid #d70018;
  }

  .nav-links h4 {
    margin-bottom: 0.7rem;
    color: #d70018;
    font-size: 0.9rem;
  }

  .nav-links a {
    display: block;
    padding: 0.5rem 1rem;
    color: #333;
    text-decoration: none;
    border-radius: 4px;
    transition: all 0.3s;
    font-size: 0.85rem;
  }

  .nav-links a:hover {
    background: #fff5f5;
    color: #d70018;
  }
</style>

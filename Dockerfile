FROM php:7.4-apache

# Copy custom Apache configuration
COPY apache-singlethread-config.conf /etc/apache2/conf-available/single-thread.conf

# Enable the configuration
RUN a2enconf single-thread

# Copy the PHP script to the web root
COPY index.php /var/www/html/

# Set permissions (optional but recommended)
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache in foreground
CMD ["apache2-foreground"]

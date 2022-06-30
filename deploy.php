<?php
namespace Deployer;

require 'recipe/laravel.php';

// Config

set('repository', 'git@github.com:montheooo/laravel-test');

add('shared_files', []);
add('shared_dirs', []);
add('writable_dirs', []);

// Hosts

host('localhost')
    ->set('remote_user', 'deployer')
    ->set('deploy_path', '~/laravel-test');
host(' 51.103.39.0')
    ->set('remote_user', 'deployer')
    ->set('deploy_path', '~/laravel-test');

// Tasks

task('build', function () {
    cd('{{release_path}}');
    run('npm run build');
});

after('deploy:failed', 'deploy:unlock');

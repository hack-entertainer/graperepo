<?php

return [

  /*
    |--------------------------------------------------------------------------
    | Cloudinary Credentials
    |--------------------------------------------------------------------------
    |
    | Loaded directly from .env
    | Used by uploads and Admin API access.
    |
    */

  'cloud_name' => env('CLOUDINARY_CLOUD_NAME'),
  'api_key'    => env('CLOUDINARY_API_KEY'),
  'api_secret' => env('CLOUDINARY_API_SECRET'),

  'cloud_url' => env('CLOUDINARY_URL'),

  /*
    |--------------------------------------------------------------------------
    | Upload Defaults
    |--------------------------------------------------------------------------
    */

  // Always serve HTTPS URLs when applicable
  'secure' => true,
];

<?php

return [

  /*
    |--------------------------------------------------------------------------
    | Cloudinary Credentials
    |--------------------------------------------------------------------------
    |
    | These values are loaded from your .env file.
    |
    */

  'cloud_url' => env('CLOUDINARY_URL'),

  'cloud_name' => env('CLOUDINARY_CLOUD_NAME'),
  'api_key'    => env('CLOUDINARY_API_KEY'),
  'api_secret' => env('CLOUDINARY_API_SECRET'),

  /*
    |--------------------------------------------------------------------------
    | Upload Defaults
    |--------------------------------------------------------------------------
    */

  'upload_preset' => env('CLOUDINARY_UPLOAD_PRESET', null),

  'secure' => true,

];

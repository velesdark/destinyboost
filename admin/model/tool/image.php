<?php

class ModelToolImage extends Model
{
    public function resize($filename, $width, $height)
    {
        if (!is_file(DIR_IMAGE . $filename)) {
            if (is_file(DIR_IMAGE . 'no_image.jpg')) {
                $filename = 'no_image.jpg';
            } elseif (is_file(DIR_IMAGE . 'no_image.png')) {
                $filename = 'no_image.png';
            } else {
                return;
            }
        }

        $extension = pathinfo($filename, PATHINFO_EXTENSION);

        $image_old = $filename;
        $image_new = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . $width . 'x' . $height . '.' . $extension;

        if (!is_file(DIR_IMAGE . $image_new) || (filectime(DIR_IMAGE . $image_old) > filectime(DIR_IMAGE . $image_new))) {
            list($width_orig, $height_orig, $image_type) = getimagesize(DIR_IMAGE . $image_old);

            if (!in_array($image_type, array(IMAGETYPE_PNG, IMAGETYPE_JPEG, IMAGETYPE_GIF))) {
                return DIR_IMAGE . $image_old;
            }

            $path = '';

            $directories = explode('/', dirname($image_new));

            foreach ($directories as $directory) {
                $path = $path . '/' . $directory;

                if (!is_dir(DIR_IMAGE . $path)) {
                    @mkdir(DIR_IMAGE . $path, 0777);
                }
            }

            if ($width_orig != $width || $height_orig != $height) {
                $image = new Image(DIR_IMAGE . $image_old);
                $image->resize($width, $height);
                $image->save(DIR_IMAGE . $image_new);
            } else {
                copy(DIR_IMAGE . $image_old, DIR_IMAGE . $image_new);
            }
        }

        $imagepath_parts = explode('/', $image_new);
        $new_image = implode('/', array_map('rawurlencode', $imagepath_parts));

        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            return HTTPS_CATALOG . 'image/' . $image_new;
        } else {
            return HTTP_CATALOG . 'image/' . $image_new;
        }
    }
}

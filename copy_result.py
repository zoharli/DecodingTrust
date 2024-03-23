import os
import shutil

def copy_matching_files(src_dir, comparison_dir, dest_dir):
    """
    Copies files from src_dir to dest_dir that have the same relative path as in comparison_dir.

    :param src_dir: Source directory (folder B in your case)
    :param comparison_dir: Directory to compare the relative paths against (folder A in your case)
    :param dest_dir: Destination directory where matching files will be copied (folder C in your case)
    """
    # Ensure destination directory exists
    os.makedirs(dest_dir, exist_ok=True)

    # Walk through the comparison directory to find files
    for root, dirs, files in os.walk(comparison_dir):
        for file in files:
            # Generate the relative path
            relative_path = os.path.relpath(os.path.join(root, file), comparison_dir)
            # Check if this file exists in the source directory
            src_file_path = os.path.join(src_dir, relative_path)
            if os.path.exists(src_file_path):
                # Create the destination path
                dest_file_path = os.path.join(dest_dir, relative_path)
                os.makedirs(os.path.dirname(dest_file_path), exist_ok=True)
                # Copy the file
                shutil.copy2(src_file_path, dest_file_path)
                print(f"Copied: {src_file_path} to {dest_file_path}")

# Example usage
src_dir = 'results_default'  # Replace with the actual path to folder B
comparison_dir = 'results'  # Replace with the actual path to folder A
dest_dir = 'results_trust'  # Replace with the desired path to folder C

copy_matching_files(src_dir, comparison_dir, dest_dir)


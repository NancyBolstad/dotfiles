tag="$(git describe --tags --always)"

if [ -n "$(echo $tag | grep -E '.*\..*\..*')" ]; then
  major=$(echo $tag | cut -d. -f1)
  minor=$(echo $tag | cut -d. -f2)
  patch=$(echo $tag | cut -d. -f3)
  major_version_tag=$major.x
  minor_version_tag=$major.$minor.x
  patch_version_tag=$major.$minor.$patch
  tag_list="$major_version_tag $minor_version_tag $patch_version_tag"
else
  tag_list=$tag
fi

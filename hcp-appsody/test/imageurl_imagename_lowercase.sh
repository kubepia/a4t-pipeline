IMAGE=image-registry.openshift-image-registry.svc:5000/11st/Java:laTest
echo $IMAGE

firstHalfURL=$(echo $IMAGE | rev |cut -d"/" -f2- | rev)
echo "FIRST:$firstHalfURL"

secondHalfURL=$(echo $IMAGE | rev| cut -d"/" -f1 | rev)
echo "SECOND:$secondHalfURL"

thirdfURL=$(echo $IMAGE | rev| cut -d"/" -f3 | rev)
echo "TH:$thirdfURL"

if [[ $secondHalfURL == *":"* ]]; then
  imagename=$(cut -d ':' -f1 <<< "$secondHalfURL" )
  imagename_lowercase=$(echo $imagename |  tr '[:upper:]' '[:lower:]')
  tagname=$(cut -d ':' -f2- <<< "$secondHalfURL" )
OUTPUTS_RESOURCE_DOCKER_IMAGE_URL_LOWERCASE=$firstHalfURL/$imagename_lowercase:$tagname
else
  imagename=$secondHalfURL
  imagename_lowercase=$(echo $imagename |  tr '[:upper:]' '[:lower:]')
OUTPUTS_RESOURCE_DOCKER_IMAGE_URL_LOWERCASE=$firstHalfURL/$imagename_lowercase
fi
echo "$OUTPUTS_RESOURCE_DOCKER_IMAGE_URL_LOWERCASE" 

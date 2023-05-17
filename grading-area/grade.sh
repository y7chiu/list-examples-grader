CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [[ -e "listExample.java" ]]
then
echo "File found"
else
echo "not found"
exit 1
fi

$1 > grading-area

ListExamples.java > grading-area

lib > grading-area

cp ListExample.java grading-area
cd ..
cp TestListExample grading-area
cp -r lib grading-area

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore ArrayTests

if [[$? -eq 0]]
echo "Test Success!"
else
echo "Test Failed!"

fi

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

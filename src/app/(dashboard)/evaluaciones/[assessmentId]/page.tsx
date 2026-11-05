import { notFound, redirect } from "next/navigation";
import { getCurrentUser } from "@/actions/auth.actions";
import { getAssessmentForStudent } from "@/services/assessment.service";
import { AssessmentRunner } from "@/components/assessment/AssessmentRunner";

interface AssessmentPageProps {
  params: Promise<{
    assessmentId: string;
  }>;
}

export const dynamic = "force-dynamic";

export default async function AssessmentPage({ params }: AssessmentPageProps) {
  const { assessmentId } = await params;
  const authData = await getCurrentUser();

  if (!authData) {
    redirect("/login");
  }

  const assessment = await getAssessmentForStudent(assessmentId);

  if (!assessment) {
    notFound();
  }

  return <AssessmentRunner assessment={assessment} />;
}


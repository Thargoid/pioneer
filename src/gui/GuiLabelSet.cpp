#include "Gui.h"

namespace Gui {

LabelSet::LabelSet() : Widget()
{
	m_eventMask = EVENT_MOUSEDOWN;
	m_labelsVisible = true;
	m_labelsClickable = true;
	m_labelColor = Color(1.0f,1.0f,1.0f,1.0f);
	m_font = Screen::GetFont();
}

bool LabelSet::OnMouseDown(Gui::MouseButtonEvent *e)
{
	if ((e->button == 1) && (m_labelsClickable)) {
		for (std::vector<LabelSetItem>::iterator i = m_items.begin(); i != m_items.end(); ++i) {
			if ((fabs(e->x - (*i).screenx) < 10.0f) &&
			    (fabs(e->y - (*i).screeny) < 10.0f)) {
				(*i).onClick();
				return false;
			}
		}
	}
	return true;
}

bool LabelSet::CanPutItem(float x, float y)
{
	for (std::vector<LabelSetItem>::iterator i = m_items.begin(); i != m_items.end(); ++i) {
		if ((fabs(x-(*i).screenx) < 5.0f) &&
		    (fabs(y-(*i).screeny) < 5.0f)) return false;
	}
	return true;
}

void LabelSet::Add(std::string text, sigc::slot<void> onClick, float screenx, float screeny)
{
	if (CanPutItem(screenx, screeny)) {
		m_items.push_back(LabelSetItem(text, onClick, screenx, screeny));
	}
}

void LabelSet::Add(std::string text, sigc::slot<void> onClick, float screenx, float screeny, const Color &col)
{
	if (CanPutItem(screenx, screeny)) {
		m_items.push_back(LabelSetItem(text, onClick, screenx, screeny, col));
	}
}

void LabelSet::Clear()
{
	m_items.clear();
}

void LabelSet::Draw()
{
	if (!m_labelsVisible) return;
	glColor4fv(m_labelColor);
	if (m_labelColor.a < 1.0f) glEnable(GL_BLEND);
	for (std::vector<LabelSetItem>::iterator i = m_items.begin(); i != m_items.end(); ++i) {
		if ((*i).hasOwnColor) {
			if ((*i).color.a < 1.0f) glEnable(GL_BLEND);
			glColor4fv((*i).color);
		}
		Gui::Screen::RenderString((*i).text, (*i).screenx, (*i).screeny - Gui::Screen::GetFontHeight()*0.5f, m_font.Get());
	}
	glDisable(GL_BLEND);
}

void LabelSet::GetSizeRequested(float size[2])
{
	size[0] = 800.0f;
	size[1] = 600.0f;
}

}
